import 'package:mobx/mobx.dart';
import 'package:xlo_new/models/user.dart';
import 'package:xlo_new/repositories/user_repository.dart';
part 'user_manager_store.g.dart';

class UserManageStore = _UserManageStore with _$UserManageStore;

abstract class _UserManageStore with Store {
  _UserManageStore(){

  _getCurrentUser();
  }
  @observable
  User user;
  @action 
  void setUser(User value) => user =value;
  @computed
  bool get isLoggedin => user !=null;

  Future<void> _getCurrentUser() async {
final user = await UserRepository().currentUser();
  setUser(user);
  }
}