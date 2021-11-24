/*import 'package:flutter_application_2/models/cuenta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:flutter/material.dart';

class DBHelper{
  static Database _db;
  static const String ID = 'id';
  static const String EMAIL = 'email';
  static const String PASSWORD = 'password';
  static const String TABLE ='cuenta' ;
  static const String DB_NAME ='encuesta';

Future<Database> get db  async{
    if(_db != null){
      return _db;
    }
    
    _db= await initDb();

    return _db;
  }
initDb() async{
  io.Directory documetsDirectory = await getApplicationDocumentsDirectory();
  String path= join(documetsDirectory.path, DB_NAME);
  var db= await openDatabase(path,version: 1,onCreate: _onCreate);
  return db;
}

_onCreate( Database db, int version ) async{
await db
.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $EMAIL TEXT, $PASSWORD TEXT)");

}

Future <Cuenta> save (Cuenta cuenta) async{
var dbClient = await db;
cuenta.id = await dbClient.insert(TABLE, cuenta.toMap());
 return cuenta;

}

Future<List<Cuenta>> getCuenta() async{
  var dbClient = await db;
  List<Map>maps = await dbClient.query(TABLE,Column: [ID,EMAIL,PASSWORD]);
  List<Cuenta> cuenta=[];
  if(maps.length>0){
    for(int i=0; i< maps.length; i++){
    cuenta.add(cuenta.fromMap(maps[i]));
    }
 }
 return cuenta;
}

Future <int> delete(int) async{
  var dbClient = await db;
  return await dbClient.delete(TABLE, where: '$ID = ?', WhereArg:[id]);
}

Future <int> delete(Cuenta cuenta) async{
  var dbClient = await db;
  return await dbClient.update(TABLE, cuenta.toMap(),
                           where: '$ID = ?', WhereArg:[id]);
}

Future close() async{
  var dbClient = await db;
  dbClient.close();
}


}

*/
