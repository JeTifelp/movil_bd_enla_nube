import 'package:flutter_application_2/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class UsuarioProvider {
  final _url = 'https://encuesta-76b40-default-rtdb.firebaseio.com/';
  
  Future crearUsuario(Usuario usuario) async {
    final url = Uri.parse('$_url/usuario.json');
    final resp = await http.post(url, body: usuarioModelToJson(usuario));
    return resp;
  }
  Future<Usuario> getUsuario(String email) async{
    Usuario temporal;
    final url = Uri.parse('$_url/usuario.json');
    final resp = await http.get(url);
    final Map<String,dynamic> decodeData= json.decode(resp.body);
    if(decodeData == null ){
      return null;
    }
    decodeData.forEach((id, value) { 
      final tempModel = Usuario.fromJson(value);
      tempModel.id= id;
      if(tempModel.email== email){
        temporal= tempModel;
      }
    });

    return temporal;
  }




}//fin class
