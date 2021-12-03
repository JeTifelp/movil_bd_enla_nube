import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_2/models/prueba.dart';

class PruebaProvider{
  //https://server-rest-api-mongo-herokuapp.com/api/v1/auth/register
  final _url = 'http://192.168.0.18/api/users2/';
  
  Future crearUsuario(Prueba prueba) async {
    final url = Uri.parse(_url);
    final resp = await http.post(url, body: pruebaModelToJson(prueba));
    return resp;
  }
  Future<Prueba> getPrueba(String email) async{
    Prueba temporal;
    final url = Uri.parse(_url);
    final resp = await http.get(url);
    final Map<String,dynamic> decodeData= json.decode(resp.body);
    if(decodeData == null ){
      return null;
    }
    decodeData.forEach((id, value) { 
      final tempModel = Prueba.fromJson(value);
      // tempModel.id= id;
      // if(tempModel.email== email){
      //   temporal= tempModel;
      // }
      temporal=tempModel;
    });

    return temporal;
  }
getDataMedico()async{//192.168.0.18192.168.0.18
  http.Response respuesta =  await http.get(Uri.parse('https://encuestas-server-rest-api.herokuapp.com/api/v1/encuestas/61a559b35c0a0c0aa0b23645'));//'http://192.168.0.18:8080/api/users2/'),headers: _setHeader() );//'https://jsonplaceholder.typicode.com/posts'));//'http://192.168.0.18/api/medico/'));//'http://192.168.0.18/api/users2/'));
  
  //int statusCode= respuesta.statusCode;
  //Map<String,String> headers= respuesta.headers;
  //String contenttype= headers['content-type'];
  String body = utf8.decode(respuesta.bodyBytes);
  print('________ json1111 ___');
  String json= respuesta.body;
  print('________ json ___');
  
  print(body);
  
}

_setHeader()=>{
  "Content-type": "application/json",
  "Accept":"application/json"
};

}//fin class