import 'package:flutter_application_2/models/cuenta.dart';
import 'package:sqflite/sqflite.dart';
//  import 'package:path/path.dart';
//import 'dart:io';


class DBmanager {
  Database _db ;

  initDB() async{
    _db = await openDatabase(
      'encuestas.db',
      version :1,
      onCreate: ( Database db, int version){
        db.query("CREATE TABLE cuenta (id INTEGER PRIMARY KEY, email TEXT NOT NULL, password TEXT NOT NULL);" );
      },
    );
    print('BD Inicializado');
  }

  insert(Cuenta cuenta) async {
    _db.insert("cuenta", cuenta.toMap());
  }

  Future<List<Cuenta>> getAllCuentas() async{
    List<Map<String, dynamic>> result = await _db.query('cuenta');
    
   return result.map((map) => Cuenta.fromMap(map)).toList() ;
  }


  // Future<Database> get bd  async{
  //   if(_db != null)
  //   return _db;
  //   _db= await initdb();
  // }
  //   'CREATE TABLE usuario (id INTEGER PRIMARY KEY AUTOINCREMENT, nomre, apellidopaterno, apellidomaterno, telefono, direccion, sexo, ci, estado)'
//   static Future<Database> _openDB() async {
//    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
//        onCreate: (db, version) {
//      return db.execute(
//        "CREATE TABLE usuario (id INTEGER PRIMARY KEY,  nombre TEXT, apellidopaterno TEXT, apellidomaterno TEXT, telefono INTEGER, direccion TEXT, sexo TEXT, ci INTEGER, estado TEXT)",
//      );
//    }, version: 1);
//  }
//solo abre la base de datos
// static Future<Database> _openDB() async {
//   return openDatabase(
//     join( await getDatabasesPath(),'enccuestasDB'), 
//     onCreate:(db, version){
//       return db.execute(
//        "CREATE TABLE cuenta (id INTEGER PRIMARY KEY, email TEXT, password TEXT)");
//     },
//   );
// }


// static Future<Database> _openDB() async {
//    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
//        onCreate: (db, version) {
//      return db.execute(
//        "CREATE TABLE cuenta (id INTEGER PRIMARY KEY, email TEXT, password TEXT)",
//      );
//    }, version: 1);
//  }

// static Future<void> insert(Cuenta cuenta)  async{
//   Database database = await _openDB();
//   database.insert("cuenta", cuenta.toMap());
//   // Database db = _openDB();
//   // return db.insert('cuenta',cuenta.toMap());
// }
// //static Future<List<Cuenta>>
// static Future<List<Cuenta>> cuentas() async{
//   Database database = await _openDB();
//   final List< Map<String,dynamic >> cuetasMap= await database.query('cuenta');
//    for (var n in cuetasMap) {
//      print('____'+n['email']);
//  }
//   return List.generate(cuetasMap.length, (i) => Cuenta( 
//                                                       id: cuetasMap[i]['id'],
//                                                       email: cuetasMap[i]['email'],
//                                                       password: cuetasMap[i]['password']   ));
// }

//https://www.desarrollolibre.net/blog/flutter/usando-sqlite-en-flutter
//https://youtu.be/f22sB1mPY0M?list=PLB5SYDBi8M3Hcx1jHTqsiOx_t7ujwSXIG


}//fin clase