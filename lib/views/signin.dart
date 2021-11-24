import 'package:flutter/material.dart';




class SignIn extends StatefulWidget {



  

  @override
  _MySignInState createState() => _MySignInState();
}

class _MySignInState extends State<SignIn> {
final _emailController= TextEditingController();
final _passworController= TextEditingController();


final _formKey = GlobalKey<FormState>();


 
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
    
        title: Text("Login"),
      ),
     body:Center(
      child: Form(
        key: _formKey,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(
                        height: 20,
                      ),
            TextFormField(
             controller:_emailController,
                          
              validator:(value){
                if(value.isEmpty){
                  return 'tiene ingresar un valor';

                }
                return null;
              },
              decoration: InputDecoration(
                      labelText:'Email',
                      border: OutlineInputBorder(),
                      hintText: 'valor1')

            ),
            SizedBox(
                        height: 20,
                      ),
            TextFormField(
             controller:_passworController,
              
              validator:(value){
                if(value.isEmpty){
                  return 'tiene ingresar un valor';

                }
                return null;
              },
              decoration: InputDecoration(
                      labelText:'Password',
                      border: OutlineInputBorder(),
                      hintText: 'valor1')

            ),


            SizedBox(
                        height: 20,
                      ),

            //FlatButton(onPressed: (){}, child: Text('Sumar')),
            RaisedButton(
              child: Text('SignIn'),
              onPressed:(){
               if(_formKey.currentState.validate() ){
                 //print('Guardar');
                // DBmanager.insert(
                //     //Cuenta( email: _emailController.text, password: _passworController.text )
                //   );
                Navigator.pushNamed(context, '/home');
               }
            }),

            
          ],

        

        
        ),
        
        ),
     ),

    );
    
    
    
  }
}
