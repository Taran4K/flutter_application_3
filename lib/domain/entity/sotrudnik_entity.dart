import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/data/model/doljnost.dart';
import 'package:flutter_application_3/data/model/user.dart';

class SotrudnikEntity{
  late int id;
  final String surname;
  final String name;
  final String otchestvo;
  final int age;
  final Doljnost idDoljnost;
  final User idUser;

  SotrudnikEntity(
    {
      required this.id,
      required this.surname,
      required this.name,
      required this.otchestvo,
      required this.age,
      required this.idDoljnost,
      required this.idUser,
  });
}