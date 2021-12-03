// To parse this JSON data, do
//
//     final algo = algoFromJson(jsonString);

import 'dart:convert';

EncuestaAll algoFromJson(String str) => EncuestaAll.fromJson(json.decode(str));

String algoToJson(EncuestaAll data) => json.encode(data.toJson());

class EncuestaAll {
    EncuestaAll({
        this.success,
        this.encuestas,
    });

    bool success;
    List<Encuesta> encuestas;

    factory EncuestaAll.fromJson(Map<String, dynamic> json) => EncuestaAll(
        success: json["success"],
        encuestas: List<Encuesta>.from(json["encuestas"].map((x) => Encuesta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "encuestas": List<dynamic>.from(encuestas.map((x) => x.toJson())),
    };
}

class Encuesta {
    Encuesta({
        this.id,
        this.name,
        this.description,

        this.sections,
        this.state,
        this.v,
    });

    String id;
    String name;
    String description;
    List<String> sections;
    bool state;
    int v;

    factory Encuesta.fromJson(Map<String, dynamic> json) => Encuesta(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        sections: List<String>.from(json["sections"].map((x) => x)),
        state: json["state"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "sections": List<dynamic>.from(sections.map((x) => x)),
        "state": state,
        "__v": v,
    };
}
