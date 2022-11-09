import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/domain/entity/role_entity.dart';
import 'package:flutter_application_3/domain/entity/user_entity.dart';

class User extends UserEntity {
  final String password;
  User(
    {  super.id=0, 
    required super.login,
    required super.idRole,
    required super.idsotrudnik,
    required this.password,

  });

  Map<String, dynamic> toMap(){
    return {
      'login':login,
      'password':password,
      'id_role':idRole.id,
      'id_sotrudnik':idsotrudnik.id
    };
  }

  factory User.toFromMap(Map<String,dynamic> json) {
    return User(
      id: json['id'] as int,
       login:  json['login'], 
       password: json['password'], 
       idRole: RoleEnum.values.firstWhere((element) => element.id==(json['id_role']as int)),
       idsotrudnik: Sotrudnik.toFromMap(json),
       );
  }
}