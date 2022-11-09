import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/data/model/client.dart';
import 'package:flutter_application_3/domain/entity/zakaz_entity.dart';

class Zakaz extends ZakazEntity {
  Zakaz(
    {  super.id=0, 
    required super.price,
    required super.idclient,
    required super.idsotrudnik,

  });

  Map<String, dynamic> toMap(){
    return {
      'price':price,
      'id_client':idclient.id,
      'id_sotrudnik':idsotrudnik.id
    };
  }

  factory Zakaz.toFromMap(Map<String,dynamic> json) {
    return Zakaz(
      id: json['id'] as int,
       price:  json['price'], 
       idclient: Client.toFromMap(json),
       idsotrudnik: Sotrudnik.toFromMap(json),
       );
  }
}