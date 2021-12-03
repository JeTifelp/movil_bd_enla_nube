//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestPreguntasProvider{

  //https://reqres.in/api/users?page=2

  Map data;
   List _listPreguntas=[];
   List _listSections=[];


  Future getPreguntas(String _idencuesta)async{
    //print('idid : '+_idencuesta);

     final _url = 'https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas/$_idencuesta';//final _url= 'https://reqres.in/api/users?page=2' ;
     //print(_url);
    // print('__https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas/61a559b35c0a0c0aa0b23645');
   
        final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
        
        final Map<String, dynamic> body=jsonDecode(resp.body);//extraer body devuelve dynamic     result es un mapa
        //print('id : $_idencuesta'+'-> encuesta: ${ body['encuesta']['sections']} ');  
      
        // print('data: ${ body['data'][2]['id']} ');  
        String succes= body['success'].toString();
        print(succes);
         if(succes== 'true'){      
           _listSections=body['encuesta']['sections'];//[0]['questions'];
          print('___________________________');
           for (var i = 0; i < _listSections.length; i++) {
             _listPreguntas= body['encuesta']['sections'][i]['questions'];
          
           print('lista preguntas seccion $i :'+_listPreguntas.toString());               
           }


           
           print('lista secciones'+_listSections.toString());
         }
         print('___________________________');
         print('cantidad de secciones '+_listSections.length.toString());

  }


List get listaPreguntas => _listPreguntas;

  


}//fin clase