

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/test_provider.dart';
import 'package:flutter_application_2/views/testseccion.dart';
import 'package:http/http.dart' as http;
class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

 @override
  _TestState createState() => _TestState();
}
class _TestState extends State<Test> {
  @override
  final tesProv= new TestProvider();







   @override
   void initState() {
     super.initState();
     setState(() {
     tesProv.getTest();  
     });
     
   }
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text("Home - Encuestas Mongo"),
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

      body: loginPage(),
    );
  }
Widget loginPage() {
    return Container(
      color: Colors.black26,
      child: Center(
        child: ListView.builder(
          itemCount:tesProv.listTest==null ? 0: tesProv.listTest.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(//click en un card para navegar a otro widget
                                  onLongPress: (){//ontap
                                   print(tesProv.listTest[index]['sections'].toString());// _ListPrueba[index].id);
                                    //Navigator.of(context).pop();
                                    setState(() {
                                      Navigator.push( context, MaterialPageRoute(
                                          builder: (context)=> TestSection(
                                            //_placeHprovider.listPlaceHolder          
                                            tesProv.listTest[index]['_id'].toString()                                  

                                          )
                                        ),
                                      );
                                    });
                                      
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
                                  
                                  child: miCard(
                                    tesProv.listTest[index]['name'].toString(),
                                    tesProv.listTest[index]['description'].toString()
                                    ),//_ListPrueba[index].title),
                                  // Text(
                                  //   _ListPrueba[index].title,
                                  //   style: TextStyle( fontSize: 16),
                                  // ),
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


  Widget mostrarLista(){
    return Container(
    child: Column(
                    children: [
                      Text(' Total Encuestas : '+tesProv.listTest.length.toString()),
                      Expanded(
                        
                        child: ListView.builder(
                              itemCount:tesProv.listTest.length,//_ListPrueba.length,
                              itemBuilder: ( BuildContext context, int index){
                                //return devuelve el widget que nosotros queremos ver
                                return InkWell(//click en un card para navegar a otro widget
                                  onLongPress: (){//ontap
                                    print(tesProv.listTest[index]['name']);// _ListPrueba[index].id);
                                    //Navigator.of(context).pop();
                                      // Navigator.push( context, MaterialPageRoute(
                                      //     builder: (context)=> EncuestaOption(
                                      //       tesProv.listPlaceHolder
                                      //       // _placeHprovider.listPlaceHolder[index].id,
                                      //       // _placeHprovider.listPlaceHolder[index].title,
                                      //       // _placeHprovider.listPlaceHolder[index].body

                                      //     )
                                      //   ),
                                      // );
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
                                  child: //miCard(_placeHprovider.listPlaceHolder[index].title),//_ListPrueba[index].title),
                                  Text(
                                    tesProv.listTest[index]['name'],
                                    style: TextStyle( fontSize: 16),
                                  ),
                                  ),
                                );
                              }
                              
                              ), 
                        )

                    ],
                  ),

    );

  }

  Widget crearBotonLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
      child: ElevatedButton(
        onPressed: () async {
            // Navigator.push(context, MaterialPageRoute(builder: (context){
            //     //return HomePageMongo();
            //     return HomePage();
            // }));

          //tesProv.getTest()            ;
          
          
        },
        child: Text(
          'ejecutar',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }



}//fin de clase




