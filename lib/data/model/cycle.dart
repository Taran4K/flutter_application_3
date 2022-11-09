import 'package:flutter_application_3/data/model/typecycle.dart';
import 'package:flutter_application_3/domain/entity/cycle_entity.dart';

class Cycle extends CycleEntity {
  Cycle(
    {
    super.id=0, 
    required super.name,
    required super.price,
    required super.idtypecycle,
  });

  Map<String, dynamic> toMap(){
    return {
      'price':price,
      'name':name,
      'id_typecycle':idtypecycle.id
    };
  }

  factory Cycle.toFromMap(Map<String,dynamic> json) {
    return Cycle(
      id: json['id'] as int,
       name: json['name'], 
       price: json['price'],
       idtypecycle: Typecicle.toFromMap(json),
       );
  }
}