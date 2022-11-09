abstract class DataBaseRequest{

  static String deleteTable(String table)=> 'DROP TABLE $table';
  static const String tabledoljnost='Doljnost';
  static const String tablesotrudnik='Sotrudnik';
  static const String tableRole='Role';
  static const String tableUser='User';
  static const String tableclient='Client';
  static const String tabletypecycle='Typecycle';
  static const String tablecycle='Cycle';
  static const String tablezakaz='Zakaz';
  static const String tablezakazcycle='ZakazCycle';

  static const List<String> tableList=[
    tabledoljnost,
    tablesotrudnik,
    tableRole,
    tableUser,
    tableclient,
    tabletypecycle,
    tablecycle,
    tablezakaz,
    tablezakazcycle,
  ];

  static const List<String> tableCreateList=[
     _createTabledoljnost,
    _createTablesotrudnik,
    _createTableRole,
    _createTableUsers,
    _createTableclient,
    _createTabletypecycle,
    _createTablecycle,
    _createTablezakaz,
    _createTablezakazcycle,
  ];
  
   static const String _createTabledoljnost =
      'CREATE TABLE "$tabledoljnost" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, "salary" INTEGER NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTablesotrudnik =
      'CREATE TABLE "$tablesotrudnik" ("id"	INTEGER,"Surname"	TEXT NOT NULL,"Name"	TEXT NOT NULL, "Otchestvo"	TEXT ALLOW NULL,"Age"	INTEGER NOT NULL,"id_doljnost"	INTEGER,FOREIGN KEY("id_doljnost") REFERENCES "Doljnost"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableUsers =
      'CREATE TABLE "$tableUser" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER, "id_sotrudnik"	INTEGER, FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE, FOREIGN KEY("id_sotrudnik") REFERENCES "Sotrudnik"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableclient =
      'CREATE TABLE "$tableclient" ("id" INTEGER,"Surname"	TEXT NOT NULL,"Name"	TEXT NOT NULL, "Otchestvo"	TEXT ALLOW NULL,"Age"	INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTabletypecycle =
      'CREATE TABLE "$tabletypecycle" ("id"	INTEGER,"name"	TEXT NOT NULL UNIQUE,PRIMARY KEY("id" AUTOINCREMENT) )';
  
  static const String _createTablecycle =
      'CREATE TABLE "$tablecycle" ("id" INTEGER,"name" TEXT NOT NULL,"price" INTEGER NOT NULL, "id_typecycle"	INTEGER, FOREIGN KEY("id_typecycle") REFERENCES "Typecycle"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTablezakaz =
      'CREATE TABLE "$tablezakaz" ("id"	INTEGER,"price"	INTEGER NOT NULL, "id_client"	INTEGER, "id_sotrudnik"	INTEGER, FOREIGN KEY("id_client") REFERENCES "Client"("id") ON DELETE CASCADE,FOREIGN KEY("id_sotrudnik") REFERENCES "Sotrudnik"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTablezakazcycle =
      'CREATE TABLE "$tablezakazcycle" ("id" INTEGER, "id_zakaz" INTEGER, "id_cycle" INTEGER, FOREIGN KEY("id_zakaz") REFERENCES "Zakaz"("id") ON DELETE CASCADE,FOREIGN KEY("id_cycle") REFERENCES "Cycle"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';
}