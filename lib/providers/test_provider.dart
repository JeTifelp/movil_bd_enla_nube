import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestProvider{

  //https://reqres.in/api/users?page=2

  Map data;
   List _listest=[];


  Future getTest()async{
     final _url = 'https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas';//final _url= 'https://reqres.in/api/users?page=2' ;
   
        final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
        
        final Map<String, dynamic> body=jsonDecode(resp.body);//extraer body devuelve dynamic     result es un mapa
      print('successpage: ${ body['success']} ');  
      //   print('data: ${ body['encuestas'][0]['_id']} ');  

        // print('page: ${ body['data']} ');  
        // print('data: ${ body['data'][2]['id']} ');  
        String suc= body['success'].toString();
        print(suc);
        if(suc== 'true'){
          print('Seccion  ______data: ${ body['encuestas'][1]['sections'] } ');  
          _listest=body['encuestas'];
          print(_listest.toString());
        }
        print('logitud lista'+_listest.length.toString());

  }


List get listTest => _listest;

  Future<String> obtenerEncuestaName(String nombre) async{
   String result;
   for (var item in _listest) {
        if(nombre == _listest[item]['name'] ){
          result=_listest[item]['name'];
          break;
        }else{
          print('No existe encuesta');
        }
   }
   return result;
}


}//fin clase