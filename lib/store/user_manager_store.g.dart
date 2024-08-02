// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManageStore on _UserManageStore, Store {
  Computed<bool> _$isLoggedinComputed;

  @override
  bool get isLoggedin =>
      (_$isLoggedinComputed ??= Computed<bool>(() => super.isLoggedin,
              name: '_UserManageStore.isLoggedin'))
          .value;

  final _$userAtom = Atom(name: '_UserManageStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserManageStoreActionController =
      ActionController(name: '_UserManageStore');

  @override
  void setUser(User value) {
    final _$actionInfo = _$_UserManageStoreActionController.startAction(
        name: '_UserManageStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedin: ${isLoggedin}
    ''';
  }
}
