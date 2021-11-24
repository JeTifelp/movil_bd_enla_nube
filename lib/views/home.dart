import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/usuario.dart';
import 'package:flutter_application_2/providers/registro_provider.dart';

class HomePage extends StatefulWidget {



  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
final _emailController= TextEditingController();
final _passworController= TextEditingController();
int _suma = 0;

final _formKey = GlobalKey<FormState>();


final _usuarioProvider= new UsuarioProvider();
final String email = FirebaseAuth.instance.currentUser.email;
final usuarioLogout= FirebaseAuth.instance.signOut();
 
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
    
        title: Text("HomePage"),
      ),
      //padding: EdgeInsets.all(15),
     body:ListView(
       children: [
         Container(
           child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  miCard('Encuesta 1'),
                  SizedBox(
                              height: 10,
                            ),
                  miCard('Encuesta 2'),
                  SizedBox(
                              height: 10,
                            ),
                  miCard('Encuesta 3'),
                  
                  // SizedBox(
                  //             height: 20,
                  //           ),
                  textFormFieldEmail(),
                  SizedBox(
                              height: 10,
                            ),
                  textFormFieldPassword(),
         
         
                  // SizedBox(
                  //             height: 20,
                  //           ),
         
                  //FlatButton(onPressed: (){}, child: Text('Sumar')),
                  RaisedButton(
                    child: Text('Gguardar'),
                    onPressed:(){
                     if(_formKey.currentState.validate() ){
                       //print('Guardar');
                      // DBmanager.insert(
                      //     //Cuenta( email: _emailController.text, password: _passworController.text )
                      //   );
                     }
                  }),
         
                  
                ],
         
              
         
              
              ),
              
              ),
           ),
         ),
       ],
     ),
    
    drawer: drawerPage()
    );
    
    
    
  }
//______________
Widget miCard(String titulo) {
  //https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
  return Card(
    
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.green[100],
    // Con esta propiedad agregamos margen a nuestro Card
    // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    margin: EdgeInsets.all(15),    
    // Con esta propiedad agregamos elevación a nuestro card
    // La sombra que tiene el Card aumentará
    elevation: 10,

    // La propiedad child anida un widget en su interior
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[

        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(titulo),
          subtitle: Text(
              'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
          leading: Icon(Icons.home),
        ),
        
        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () => {}, child: Text('Aceptar')),
            FlatButton(onPressed: () => {}, child: Text('Cancelar'))
          ],
        )
      ],
    ),
  );
}
 //______________ 
Widget drawerPage() {
  return Drawer(
    child: ListView(
        children: <Widget>[
          Text('Usuario'),
          DrawerHeader(
            child: Container(
              child: FutureBuilder(
                future: _usuarioProvider.getUsuario(email),                
                builder: (BuildContext context, AsyncSnapshot <Usuario>snapshot) {
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                          snapshot.data.foto                        
                           ) ,
                        ),
                        ListTile(
                          title:  Text(
                            snapshot.data.nombre

                          ),
                          subtitle: Text( email)
                        )

                      ],
                    );
                  }else{
                    return Center( child:CircularProgressIndicator() );
                  }
                  //return ;
                },
              ),
            )
          ),
          cuerpoDraw()
        ],
      ),
  );

}

Widget cuerpoDraw() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
              title: Text("Cerrar Sesión"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                usuarioLogout.then((value) => showToast(context,'El Usuario a cerrado Sesión..!!'));
                Navigator.popAndPushNamed(context, '/inicio');
              }),
       
        ],
      ),
    );
  }

Widget textFormFieldEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child:  TextFormField(
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
    );
  }
Widget textFormFieldPassword(){
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: TextFormField(
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
  );
}

  void showToast(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 3),
    ));
  }


}//end class
