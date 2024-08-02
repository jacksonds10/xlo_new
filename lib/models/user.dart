enum UserType{PARTICULAR, PROFISSIONAL}

class User {
  User({this.id,this.name,this.phone,this.email, this.password,this.type = UserType.PARTICULAR,this.createdAt});
  
  String id;
  String name;
  String phone;
  String email;
  String password;
  UserType type;
  DateTime createdAt;
  
}
