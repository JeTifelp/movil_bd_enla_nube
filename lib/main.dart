//import 'package:flutter_application_2/Constant/routes.dart';




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/homemongo.dart';

import 'package:flutter_application_2/views/test.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'views/home.dart';

import 'views/signup.dart';
import 'views/signin2.dart';
import 'views/test.dart';



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
    title: 'Encuestas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      routes:{
           '/register':( context)=> SignUp(),
            //'/login':( context)=> SignIn(),
            '/home':( context)=> HomePage(),
            '/inicio': ( context)=> Login(),

            //'/test':( context )=> Test(),
            '/homemongo':( context )=> HomePageMongo()
            

      },
      initialRoute: '/inicio',
      //initialRoute: '/inicio',
  );
  
  }
  

}



//https://encuestas-rest-api-server2.herokuapp.com
//https://us02web.zoom.us/j/81371487044?pwd=ekxsZ1pBaldqQmFjaWdHc01CQUxsZz09
