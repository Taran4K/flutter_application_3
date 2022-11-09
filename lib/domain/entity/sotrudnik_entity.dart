import 'package:flutter_application_3/data/model/doljnost.dart';
class SotrudnikEntity{
  late int id;
  final String surname;
  final String name;
  final String otchestvo;
  final int age;
  final Doljnost idDoljnost;

  SotrudnikEntity(
    {
      required this.id,
      required this.surname,
      required this.name,
      required this.otchestvo,
      required this.age,
      required this.idDoljnost
  });
}