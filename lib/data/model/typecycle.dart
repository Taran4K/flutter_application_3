import 'package:flutter_application_3/domain/entity/typecycle_entity.dart';

class Typecicle extends TypecycleEntity{
  
  Typecicle({super.id=0,required super.name});

  Map<String,dynamic> toMap() {
    return {
      'name': name
    };
  }

  factory Typecicle.toFromMap(Map<String,dynamic> json)
  {
    return Typecicle(id: json['id'] as int, name: json['name']);
  }

}