import 'package:flutter_application_3/domain/entity/client_entity.dart';

class Client extends ClientEntity{
  
  Client({
    super.id=0, 
    required super.surname,
  required super.name,
  required super.otchestvo,
  required super.age});

  Map<String,dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'otchestvo': otchestvo,
      'age': age
    };
  }

  factory Client.toFromMap(Map<String,dynamic> json)
  {
    return Client(id: json['id'] as int, surname: json['surname'], name: json['name'], otchestvo: json['otchestvo'], age: json['age']);
  }

}