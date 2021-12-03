
import 'package:flutter_application_2/models/encuesta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class EncuestaProvider {
Map data;
   List _lisEncuestas=[];


  Future<List> getEncuesta()async{
  //final _url = 'https://encuestas-rest-api-server2.herokuapp.com/api/v1/encuestas';//  url Poste
    
     final _url = 'https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas';//final _url= 'https://reqres.in/api/users?page=2' ;
   
        final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
        
        final Map<String, dynamic> body=jsonDecode(resp.body);//extraer body devuelve dynamic     result es un mapa
      print('successpage: ${ body['success']} ');  
      //   print('data: ${ body['encuestas'][0]['_id']} ');  

        // print('page: ${ body['data']} ');  
        // print('data: ${ body['data'][2]['id']} ');  
        String suc= body['success'].toString();
        print(suc);
        List _listaux=[];
        if(suc== 'true'){
          print('Seccion  ______data: ${ body['encuestas'][1]['sections'] } ');  
          _listaux=body['encuestas'];
          print(_lisEncuestas.toString());
        }
        print('logitud lista'+_listaux.length.toString());
   return _listaux;
  }


List get listEncuestas => _lisEncuestas;
setPEncuestasList(List list){
  _lisEncuestas=list;
  
}

  Future<String> obtenerEncuestaName(String nombre) async{
   String result;
   for (var item in _lisEncuestas) {
        if(nombre == _lisEncuestas[item]['name'] ){
          result=_lisEncuestas[item]['name'];
          break;
        }else{
          print('No existe encuesta');
        }
   }
   return result;
}





//     List<EncuestaAll>  _ListPrueba=[];
//    final _url = 'https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas';//'http://192.168.0.18/api/users2/';
//  //deveve una lista <Prueba>

//  Future<List<EncuestaAll>> listar() async{
//    final url = Uri.parse(_url);
//   final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
//   var datos=jsonDecode(resp.body);
//    print('hola_______________________________________________________________');
//  print(datos['encuestas']);

//   var  registro = List<EncuestaAll>();
  
//   int c=0;
//   for (var datos in datos['encuestas']) {
//     registro.add(EncuestaAll.fromJson(datos));
    
//   //  print(registro[c].); 
//   //  print(' '+c.toString() );
//    c++;
//   }
//   return registro;

//  }

 

// List<EncuestaAll> get listEncuestaAll => _ListPrueba;

// setEncuestaAllList(List<EncuestaAll> list){
//   _ListPrueba=list;
//   _ListPrueba.length=list.length;
// }
 
 

 
//  addlistAll1(List<EncuestaAll> value){
//    _ListPrueba.addAll(value);
//  }
//   setListLength(int i){
//    _ListPrueba.length=i;
//  }
//  getListLength(){
//    return _ListPrueba.length;

//  }

}//https://www.youtube.com/watch?v=EMlEbCtTePs