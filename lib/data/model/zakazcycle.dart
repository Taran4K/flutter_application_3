import 'package:flutter_application_3/data/model/cycle.dart';
import 'package:flutter_application_3/data/model/zakaz.dart';
import 'package:flutter_application_3/domain/entity/zakazcycle_entity.dart';

class ZakazCycle extends ZakazCycleEntity {
  ZakazCycle(
    {  super.id=0, 
    required super.idcycle,
    required super.idzakaz,

  });

  Map<String, dynamic> toMap(){
    return {
      'id_cycle':idcycle.id,
      'id_zakaz':idzakaz.id
    };
  }

  factory ZakazCycle.toFromMap(Map<String,dynamic> json) {
    return ZakazCycle(
      id: json['id'] as int,
       idzakaz: Zakaz.toFromMap(json),
       idcycle: Cycle.toFromMap(json),
       );
  }
}