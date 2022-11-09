import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/domain/entity/role_entity.dart';

class UserEntity{
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;
  final Sotrudnik idsotrudnik;

  UserEntity(
    {
      required this.id,
      required this.login,
      this.password='',
      required this.idRole,
      required this.idsotrudnik
  });
}