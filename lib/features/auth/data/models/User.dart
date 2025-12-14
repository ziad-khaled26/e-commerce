import 'package:ecommerce_app/features/auth/domin/entities/user_entitiy.dart';

class User {
  const User({
      required this.name,
      required this.email,
      required this.role,});

  factory User.fromJson(dynamic json) {
    return User(name: json['name'], email: json['email'], role: json['role']);

  }
  final String name;
  final String email;
  final String role;

  UserEntity toUserEntity(){
    return UserEntity(name: name, email: email, role: role);
  }
}