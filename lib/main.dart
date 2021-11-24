//import 'package:flutter_application_2/Constant/routes.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'views/home.dart';
import 'views/signin.dart';
import 'views/signup.dart';
//import 'views/login_view';
import 'views/home copy.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) =>{
    runApp(MyApp())
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'flutter-Sqlite',
    theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),
      routes:{
           '/register':( context)=> SignUp(),
            '/login':( context)=> SignIn(),
            '/home':( context)=> HomePage(),
            '/inicio': ( context)=> Login()
            

      },
      initialRoute: '/inicio',
  );
  
  }
  

}


