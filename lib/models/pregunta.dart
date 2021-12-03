import 'dart:convert';

Pregunta placeholderModelFromJson(String str) =>
  Pregunta.fromJson(json.decode(str));

String PreguntaModelToJson(Pregunta data) => json.encode(data.toJson());

class Pregunta{
   
  int id;
  String enunciado;
  String tipo;
  int idEncuesta;
  

  Pregunta({    
    this.id,
    this.enunciado,
    this.idEncuesta
    
  });

  factory Pregunta.fromJson(Map<String, dynamic> json) => new Pregunta(
        id        : json["id"],
        enunciado : json["enunciado"],
        idEncuesta: json["idEncuesta"]
        
      );

  Map<String, dynamic> toJson() => {
        "id"         : id,
        "enunciado"  : enunciado,
        "idEncuesta" : idEncuesta
        
      };

}