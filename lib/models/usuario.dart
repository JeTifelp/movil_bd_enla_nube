import 'dart:convert';

Usuario usuarioModelFromJson(String str) =>
    Usuario.fromJson(json.decode(str));

String usuarioModelToJson(Usuario data) => json.encode(data.toJson());

class Usuario{
  

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
  String idu;
  String nombre;
  String email;
  String password;
  String foto;
  bool estado;
  String tipo;

  Usuario({
    this.id,
    this.idu,
    this.nombre,
    this.email,
    this.password,
    this.estado = true,
    this.foto = "",
    this.tipo = "c",
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => new Usuario(
        id: json["id"],
        idu: json["idu"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        estado: json["estado"],
        foto: json["foto"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idu": idu,
        "nombre": nombre,
        "email": email,
        "password": password,
        "estado": estado,
        "foto": foto,
        "tipo": tipo,
      };

}