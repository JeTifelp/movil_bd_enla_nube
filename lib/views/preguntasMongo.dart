

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/models/usuario.dart';
import 'package:flutter_application_2/providers/preguntas_provider.dart';
import 'package:flutter_application_2/providers/registro_provider.dart';
import 'package:flutter_application_2/providers/test_provider.dart';

class PreguntasMongo extends StatefulWidget {
  final String _idencuesta;
  
  PreguntasMongo(this._idencuesta,{Key key}) : super(key: key);

 @override
  _PreguntasMongoState createState() => _PreguntasMongoState();
}
class _PreguntasMongoState extends State<PreguntasMongo> {
  //para login
// final _usuarioProvider= new UsuarioProvider();
// final String email = FirebaseAuth.instance.currentUser.email;
// final usuarioLogout= FirebaseAuth.instance.signOut();
  @override
  final _preguntaProv= new PreguntasProvider();







   @override
   void initState() {
     super.initState();
     var aux=widget._idencuesta.replaceAll('[', '');
    var url=aux.replaceAll(']', '');

     _preguntaProv.getPreguntas(url).then((value){
      setState(() {
        _preguntaProv.setPreguntasList(value);
      });

    } );
     
   }
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text("Preguntas-Mongo"),
        actions: [
          IconButton(
            onPressed:(){}, 
            icon: Icon(Icons.notifications)
            ),
          IconButton(
            onPressed:(){}, 
            icon: Icon(Icons.search)
            )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
        elevation: 20,
      ),

      body: preguntasPage(),
    );
  }
Widget preguntasPage() {
    return Container(
      color: Colors.black26,
      child: Center(
        child: ListView.builder(
          itemCount:_preguntaProv.listaPreguntas==null ? 0: _preguntaProv.listaPreguntas.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(//click en un card para navegar a otro widget
                                  onLongPress: (){//ontap
                                   print(_preguntaProv.listaPreguntas[index]['name'].toString());// _ListPrueba[index].id);
                                    //Navigator.of(context).pop();
                                    
                                      
                                  },

                                  child: Container(
                                    decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.black12,Colors.white70
                                      // Color(0x11111111),
                                      // Color(0xFF2979FF),
                                      // Color(0xFFC8E6C9),
                                    ])),
                                    padding: EdgeInsets.all(15),
                                  //   decoration: BoxDecoration(
                                  //     border: Border(
                                  //       bottom: BorderSide( color: Colors.blue, width:1
                                  //       )
                                  //   ),
                                  // ),
                                  
                                  child:Column(
                                      children: [
                                        
                                        Text(
                                          
                                        '¿'+_preguntaProv.listaPreguntas[index]['name']+'?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                         ),
                                        
                                      ),
                                      //https://www.youtube.com/watch?v=N-Jw-Nf_gZ0
                                      for (int i=0;i<3;i++)
                                      Container(
                                        width: double.infinity,
                                        child: MaterialButton(
                                          shape: StadiumBorder(),
                                          color: Colors.blue,
                                          onPressed: (){},
                                          child: Text('R$i',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                            
                                          ),
                                        )
                                      )
                                      


                                      ],
                                    ),
                                    
                                  ),
                                );
          },
        ),
        // child: ListView(
        //   children: [
            
        //     SizedBox(
        //       height: 20,
        //     ),
        //     Center(
        //       child: Text(
        //         "LOGIN",
        //         style: TextStyle(
        //             color: Colors.orange,
        //             fontSize: 45,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
            
        //     crearBoton
        // Login(),
            
            
        //   ],
        // ),
      ),
    );
  }
Widget miCard(String titulo,String description) {
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
          title: Text(titulo,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),
          ),
          subtitle: Text(
               description
              ),
          leading: Icon(Icons.poll,size: 80,color:Colors.red ,),
        ),
        
        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () { 
                    //            PruebaProvider p = new PruebaProvider();
                    //  p.getDataMedico();
                     }, child: Text('Aceptar')),
            FlatButton(onPressed: () => {}, child: Text('Cancelar'))
          ],
        )
      ],
    ),
  );
}
//__________MENU_______
// Widget drawerPage() {
//   return Drawer(
    
//     child: ListView(
//         children: <Widget>[
//           Text('Usuario'),
//           DrawerHeader(
//             child: Container(
//               color: Colors.green[100],
//               child: FutureBuilder(
//                 future: _usuarioProvider.getUsuario(email),                
//                 builder: (BuildContext context, AsyncSnapshot <Usuario>snapshot) {
//                   if(snapshot.hasData){
//                     return Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(
//                           snapshot.data.foto                        
//                            ) ,
//                         ),
//                         ListTile(
//                           title:  Text(
//                             snapshot.data.nombre

//                           ),
//                           subtitle: Text( email)
//                         )

//                       ],
//                     );
//                   }else{
//                     return Center( child:CircularProgressIndicator() );
//                   }
//                   //return ;
//                 },
//               ),
//             )
//           ),
//           cuerpoDraw()
//         ],
//       ),
//   );

// }

// Widget cuerpoDraw() {
//     return Container(
//       color: Colors.orange[100],
//       child: Column(
//         children: [
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Inicio"),
//             trailing: Icon(Icons.keyboard_arrow_right),
//           ),
//           ListTile(
//               title: Text("Cerrar Sesión"),
//               leading: Icon(Icons.person),
//               trailing: Icon(Icons.keyboard_arrow_right),
//               onTap: () {
//                 usuarioLogout.then((value) => showToast(context,'El Usuario a cerrado Sesión..!!'));
//                 Navigator.popAndPushNamed(context, '/inicio');
//               }),
       
//         ],
//       ),
//     );
//   }

//   void showToast(BuildContext context, String mensaje) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(mensaje),
//       duration: Duration(seconds: 3),
//     ));
//   }



  
}//fin de clase




