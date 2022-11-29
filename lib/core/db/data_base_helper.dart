import 'dart:io';
import 'package:flutter_application_3/common/data_base_request.dart';
import 'package:flutter_application_3/data/model/Sotrudnik.dart';
import 'package:flutter_application_3/data/model/client.dart';
import 'package:flutter_application_3/data/model/cycle.dart';
import 'package:flutter_application_3/data/model/doljnost.dart';
import 'package:flutter_application_3/data/model/role.dart';
import 'package:flutter_application_3/data/model/typecycle.dart';
import 'package:flutter_application_3/data/model/user.dart';
import 'package:flutter_application_3/data/model/zakaz.dart';
import 'package:flutter_application_3/data/model/zakazcycle.dart';
import 'package:flutter_application_3/domain/entity/role_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentoryDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentoryDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentoryDirectory.path, 'test.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(_pathDB,
          version: _version,
          onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
          onCreate: (db, version) => onCreateTable(db));
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(
        DataBaseRequest.tabledoljnost,
        Doljnost(name: 'Продавец', salary: 50000).toMap(),
      );

      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }
      db.insert(
        DataBaseRequest.tableUser,
        User(login: 'admin', idRole: RoleEnum.admin, password: 'admin123')
            .toMap(),
      );

      db.insert(
        DataBaseRequest.tablesotrudnik,
        Sotrudnik(
                surname: 'Иванов',
                name: 'Иван',
                otchestvo: 'Иванович',
                age: 32,
                idDoljnost: Doljnost(name: 'Продавец', salary: 50000),
                idUser: User(
                    login: 'admin',
                    idRole: RoleEnum.admin,
                    password: 'admin123'))
            .toMap(),
      );

      db.insert(
        DataBaseRequest.tableclient,
        Client(surname: 'Иванов', name: 'Иван', otchestvo: 'Иванович', age: 32)
            .toMap(),
      );

      db.insert(
        DataBaseRequest.tabletypecycle,
        Typecicle(name: 'Горный').toMap(),
      );

      db.insert(
        DataBaseRequest.tablecycle,
        Cycle(
                name: 'Велосипед М922Р',
                price: 5000,
                idtypecycle: Typecicle(name: 'Горный'))
            .toMap(),
      );

      db.insert(
        DataBaseRequest.tablezakaz,
        Zakaz(
                price: 5000,
                idclient: Client(
                    surname: 'Иванов',
                    name: 'Иван',
                    otchestvo: 'Иванович',
                    age: 32),
                idsotrudnik: Sotrudnik(
                    surname: 'Иванов',
                    name: 'Иван',
                    otchestvo: 'Иванович',
                    age: 32,
                    idDoljnost: Doljnost(name: 'Продавец', salary: 50000),
                    idUser: User(
                        login: 'admin',
                        idRole: RoleEnum.admin,
                        password: 'admin123')))
            .toMap(),
      );

      db.insert(
        DataBaseRequest.tablezakazcycle,
        ZakazCycle(
                idcycle: Cycle(
                    name: 'Велосипед М922Р',
                    price: 5000,
                    idtypecycle: Typecicle(name: 'Горный')),
                idzakaz: Zakaz(
                    price: 5000,
                    idclient: Client(
                        surname: 'Иванов',
                        name: 'Иван',
                        otchestvo: 'Иванович',
                        age: 32),
                    idsotrudnik: Sotrudnik(
                        surname: 'Иванов',
                        name: 'Иван',
                        otchestvo: 'Иванович',
                        age: 32,
                        idDoljnost: Doljnost(name: 'Продавец', salary: 50000),
                        idUser: User(
                            login: 'admin',
                            idRole: RoleEnum.admin,
                            password: 'admin123'))))
            .toMap(),
      );
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
