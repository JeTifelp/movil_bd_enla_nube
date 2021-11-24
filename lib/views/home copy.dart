import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/auth_service.dart';
import 'package:flutter_application_2/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  //Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";  
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginPage(),
    );
  }



  Widget loginPage() {
    return Container(
      child: Center(
        child: ListView(
          children: [
            
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Bienvenido",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            crearCampoEmail(),
            crearCampoPassword(),
            crearBotonLogin(),
            crearFootRegistro()
          ],
        ),
      ),
    );
  }
Widget crearCampoEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        controller: emailController,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.red),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            hintText: 'email de usuario',
            labelText: 'email',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'su email debe contener un @',
            helperStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.alternate_email,
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(

            hintStyle: TextStyle(color: Colors.red),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            hintText: 'password usuario',
            labelText: 'password',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'ingresa tu password',
            helperStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(
              Icons.security_outlined,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.lock,
              color: Colors.black,
            )),
        onChanged: (valor) {
          password = valor;
        },
      ),
    );
  }
  Widget crearBotonLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
      child: ElevatedButton(
        onPressed: () async {
          AuthService auth = AuthService();
          User user  = await  ( auth.login(email, password, context));
          if (user != null) {
            showToast(context,'usuario Encontrado' );
            emailController.clear();
            passwordController.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage();
            }));
            SharedPreferences prefs= await SharedPreferences.getInstance();
            prefs.setString('usuario', 'login');
            
          } else {
            showToast(context, 'usuario no encontrado');
            emailController.clear();
            passwordController.clear();
          }
          
        },
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
 Widget crearFootRegistro() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          Text(
            "aun no estas registrad@ ?",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/register');
                });
              },
              child: Text(
                "Registrate !!!!",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }

void showToast(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    ));
  }




}//fin class