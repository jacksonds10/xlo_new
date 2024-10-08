import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_new/repositories/user_repository.dart';
import 'package:xlo_new/store/user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;
  
  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid =>
      email != null && email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+$'));

  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else {
      return 'Email inválido';
    }
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;

  String get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @computed
  Function get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

@observable
String error;
  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      //  Future.delayed(Duration(seconds: 3));
      GetIt.I<UserManageStore>().setUser(user);
      print(user);
    }
    catch(e){

      error =e ;
    }
    loading = false;

  }
}
