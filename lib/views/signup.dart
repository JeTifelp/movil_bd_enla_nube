import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/dbmanager.dart';
import 'package:flutter_application_2/models/cuenta.dart';


import 'package:flutter_application_2/models/usuario.dart';
import 'package:flutter_application_2/providers/registro_provider.dart';
import 'package:flutter_application_2/service/auth_service.dart';
//import 'package:flutter_application_2/views/home%20copy.dart';
import 'package:flutter_application_2/views/encuestaoption.dart';
import 'package:flutter_application_2/views/signin2.dart';



class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);


  

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
DBmanager db = DBmanager();

String email;
  String password;
  final usuario = new Usuario();
  final usuarioProvider = new UsuarioProvider();
  final nombreController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
    

// child:ListView(
//              children:<Widget> [],

//             ),
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
    
        title: Text("RegiStro"),
      ),
      body: registroPage(),
    );

  }//BUILD



//______________Registro_______________
Widget registroPage() {
    return Container(
      child: Center(
        child: ListView(
          children: [
            crearTituloRegistro(),
            crearCampoNombre(),
            crearCampoEmail(),
            crearCampoPassword(),
            crearBotonRegistro(),
            crearFootLogin()
          ],
        ),
      ),
    );
  }

 Widget crearTituloRegistro() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          "REGISTRO",
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget crearCampoNombre() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: nombreController,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            hintText: 'nombre de usuario',
            labelText: 'nombre',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'su nombre sera como un alias en su perfil',
            helperStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.emoji_people_sharp,
              color: Colors.black,
            )),
        onChanged: (valor) {
          usuario.nombre = valor;
        },
      ),
    );
  }

  Widget crearCampoEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: emailController,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            hintText: 'email de usuario',
            labelText: 'email',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'ingresar email valido',
            helperStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.email_outlined,
              color: Colors.black,
            )),
        onChanged: (valor) {
          email = valor;
        },
      ),
    );
  }

  Widget crearCampoPassword() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            hintText: 'password de usuario',
            labelText: 'password',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'su password debe tener al menos 8 caracteres',
            helperStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(
              Icons.lock_rounded,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.lock_open_rounded,
              color: Colors.black,
            )),
        onChanged: (valor) {
          password = valor;
        },
      ),
    );
  }


Widget crearBotonRegistro() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        child: ElevatedButton(
            onPressed: () async {
              AuthService auth = AuthService();
              UserCredential credential =
                  await auth.register(email, password, context);

              setState(() {
                if (credential.user != null) {
                  usuario.idu = credential.user.uid;
                  usuario.email = email;
                  usuario.password = password;
                  
                  usuarioProvider.crearUsuario(usuario);
                  showToast(context, "usuario registrado exitosamente");
                  nombreController.clear();
                  emailController.clear();
                  passwordController.clear();

                  Navigator.popAndPushNamed(context, '/inicio');
                } else {
                  showToast(context, "usuario no registrado");
                  nombreController.clear();
                  emailController.clear();
                  passwordController.clear();
                }
              });
            },
            child: Text('Registrar')));
  }

  Widget crearFootLogin() {
    return Column(
      children: [
        Text(
          "¿ ya tienes una cuenta ?",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
            child: Text(
              "iniciar sesion",
              style: TextStyle(fontSize: 18),
            )),
      ],
    );
  }

  void showToast(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    ));
  }



// //_______________________________________
// _showList( BuildContext context){
//   return FutureBuilder(
//     future: db.getAllCuentas(),    
//     builder: (BuildContext context, AsyncSnapshot<List<Cuenta>> snapshot) {
//       if(snapshot.hasData){

//       return ListView(
//         children:<Widget> [
//           for (Cuenta item in  snapshot.data) ListTile( title: Text(item.Email))
            
//         ],

//       ) ;
//       }else { return Center(
//         child: Text( 'add cuenta'),
//       );
                  
//       }
//     },
//   );

// }
// _addCuenta(){
//   showDialog(
//     context: context,
//     builder: (context){
//       return SimpleDialog(
//         children: <Widget>[
//           TextField(
//             decoration:  InputDecoration(icon: Icon(Icons.add_circle_outline)),
//             onSubmitted: ( text ){
//               setState(() {
                
//                 String cad2= 'password';
//                //  Cuenta cuenta = new Cuenta(text, cad2);
//                 // db.insert(cuenta);
//                 Navigator.pop(context);
//               });
//             },
//           ),
//         ],
//       );
//     }
//     );
// }


}//fin class