import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/data/model/doljnost.dart';
import 'package:flutter_application_3/data/model/user.dart';
import 'package:flutter_application_3/domain/entity/sotrudnik_entity.dart';

class Sotrudnik extends SotrudnikEntity {
  Sotrudnik(
    {  super.id=0, 
    required super.surname,
    required super.name,
    required super.otchestvo,
    required super.age,
    required super.idDoljnost,
    required super.idUser,
  });

  Map<String, dynamic> toMap(){
    return {
      'surname':surname,
      'name':name,
      'otchestvo':otchestvo,
      'age':age,
      'id_doljnost':idDoljnost.id,
      'id_user':idUser.id,
    };
  }

  factory Sotrudnik.toFromMap(Map<String,dynamic> json) {
    return Sotrudnik(
      id: json['id'] as int,
       surname:  json['surname'], 
       name: json['name'], 
       otchestvo: json['otchestvo'], 
       age: json['naageme'], 
       idDoljnost: Doljnost.toFromMap(json),
       idUser: User.toFromMap(json),
       );
  }
}