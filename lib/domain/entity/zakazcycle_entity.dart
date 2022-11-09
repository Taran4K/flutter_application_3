import 'package:flutter_application_3/data/model/cycle.dart';
import 'package:flutter_application_3/data/model/zakaz.dart';

class ZakazCycleEntity{
  late int id;
  final Zakaz idzakaz;
  final Cycle idcycle;

  ZakazCycleEntity({
    required this.id,
    required this.idzakaz,
    required this.idcycle,});
}