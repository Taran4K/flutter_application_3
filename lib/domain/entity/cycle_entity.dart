import 'package:flutter_application_3/data/model/typecycle.dart';

class CycleEntity{
  late int id;
  final String name;
  final int price;
  final Typecicle idtypecycle;

  CycleEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.idtypecycle,});
}