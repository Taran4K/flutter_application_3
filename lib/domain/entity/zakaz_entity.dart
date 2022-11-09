import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/data/model/client.dart';

class ZakazEntity{
  late int id;
  final int price;
  final Client idclient;
  final Sotrudnik idsotrudnik;

  ZakazEntity({
    required this.id,
    required this.idclient,
    required this.price,
    required this.idsotrudnik,});
}