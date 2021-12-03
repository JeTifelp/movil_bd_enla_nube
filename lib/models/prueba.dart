import 'dart:convert';

Prueba pruebaModelFromJson(String str) =>
    Prueba.fromJson(json.decode(str));

String pruebaModelToJson(Prueba data) => json.encode(data.toJson());

class Prueba{
  

  //   String nombre;
  //   String apellidopaterno;
  //   String apellidomaterno;
  //   String telefono;
  //   String direccion;
  //   String sexo;
  //   int ci;
  //   // String foto;    
  //   // DateTime fechanacimiento;
  //   // String usuarioregistro;// "Admin",
  //   // String usuariomodificacion;//"admin2",
  //   // DateTime fecharegistro;//"2021-08-31",
  //   // DateTime fechamodificacion;
  //   String estado;// "ACT"

  //   Usuario(){
  //       this.nombre;
  //       this.apellidomaterno;
  //       this.apellidopaterno;
  //       this.telefono;
  //       this.direccion;
  //       this.sexo;
  //       this.ci;
  //       this.estado;
  //   }
  // Usuario.empty();
  
  //   Map<String,dynamic> toMap(){
  //       return{
  //       'nombre':nombre,
  //       'apellidomaterno':apellidomaterno,
  //       'apellidopaterno':apellidopaterno,
  //       'telefono':telefono,
  //       'direccion': direccion,
  //       'sexo':sexo,
  //       'ci':ci,
  //       'estado':estado
  //       };
  //   }
  String id;  
  String nombre;
  String email;
  String password;
  

  Prueba({
    this.id,    
    this.nombre,
    this.email,
    this.password
    
  });

  factory Prueba.fromJson(Map<String, dynamic> json) => new Prueba(
        id: json["id"],        
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"]
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,        
        "nombre": nombre,
        "email": email,
        "password": password
        
      };

}