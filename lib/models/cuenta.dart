class Cuenta{
   int id;
   String email;
    String password;

Cuenta( this.id ,this.email, this.password);
//a Map
Map< String,dynamic> toMap(){
        return{  
          'id':id,      
        'email':email,
        'password':password
        };
        
}
String get Email => email;
String get Password => password;
//del mapa
Cuenta.fromMap (Map<String, dynamic> map)  {
   id= map['id'];
    email= map['email'] ;
    password=map['password'];
  
}
// Cuenta.fromMap(dynamic obj){
//   this.email= obj['email'];
//   this.password= obj['password'];
// }


}//class

