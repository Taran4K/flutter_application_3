import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/domain/entity/doljnost_entity.dart';
import 'package:flutter_application_3/domain/entity/role_entity.dart';

class Doljnost extends DoljnostEntity{
  
  Doljnost({super.id=0, 
  required super.name,
  required super.salary});

  Map<String,dynamic> toMap() {
    return {
      'name': name,
      'salary': salary,
    };
  }

  factory Doljnost.toFromMap(Map<String,dynamic> json)
  {
    return Doljnost(id: json['id'] as int,name: json['name'], salary: json['salary']);
  }

}