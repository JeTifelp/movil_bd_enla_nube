
import 'package:flutter_application_2/models/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaceholderProvider{

    List<Placeholder1>  _ListPrueba=[];
   final _url = 'https://jsonplaceholder.typicode.com/posts';//'http://192.168.0.18/api/users2/';
 //deveve una lista <Prueba>

 Future<List<Placeholder1>> listar() async{
   final url = Uri.parse(_url);
  final resp = await http.get(Uri.parse(_url)).timeout(Duration(seconds: 90));
  var datos=jsonDecode(resp.body);
   print('hola__________________________________________________________________');
   print(datos);

  var  registro = List<Placeholder1>();
  
  int c=0;
  for (var datos in datos) {
    registro.add(Placeholder1.fromJson(datos));
    
   print(registro[c].title); 
   print(' '+c.toString() );
   c++;
  }
  return registro;

 }

 

List<Placeholder1> get listPlaceHolder => _ListPrueba;
setPlaceholderList(List<Placeholder1> list){
  _ListPrueba=list;
  _ListPrueba.length=list.length;
}
 
 
 addlistAll1(List<Placeholder1> value){
   _ListPrueba.addAll(value);
 }
  setListLength(int i){
   _ListPrueba.length=i;
 }
 getListLength(){
   return _ListPrueba.length;

 }

}//https://www.youtube.com/watch?v=EMlEbCtTePs