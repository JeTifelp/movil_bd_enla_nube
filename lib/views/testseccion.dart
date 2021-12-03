

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/test_provider.dart';
import 'package:flutter_application_2/providers/testpregunta_provider.dart';

class TestSection extends StatefulWidget {
  final String _idencuesta;
  // final String val2;
  // final String val3;
  // final  List<Placeholder1> listObj;
  // EncuestaOption(this.listObj,{Key key}) : super(key: key);
  TestSection(this._idencuesta,{Key key}) : super(key: key);
  

  @override
  

  _TestSectionState createState() => _TestSectionState();
}



class _TestSectionState extends State<TestSection> {
  
  final _tprovPreguntas= new TestPreguntasProvider();
  
  @override
  void initState() {
    super.initState();
    var aux=widget._idencuesta.replaceAll('[', '');
    var url=aux.replaceAll(']', '');
    //print(object)
    setState(() {
        
      _tprovPreguntas.getPreguntas(url);
    });

  }
    
  @override
  Widget build(BuildContext context)=> Scaffold(
    extendBodyBehindAppBar: true,
    appBar:  AppBar(
      title: Text("Seccion"),
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
    body://child:  Text(widget._idencuesta) 
      MostrarPreguntas()
    
  

  );
  Widget MostrarPreguntas() {
    return Container(
      
      
      child: Center(
        child: ListView.builder(
          itemCount:_tprovPreguntas.listaPreguntas ==null ? 0: _tprovPreguntas.listaPreguntas.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(//click en un card para navegar a otro widget
                                  onLongPress: (){//ontap
                                   print(_tprovPreguntas.listaPreguntas[index]['name'].toString());// _ListPrueba[index].id);
                                    //Navigator.of(context).pop();
                                      // Navigator.push( context, MaterialPageRoute(
                                      //     builder: (context)=> TestSection(
                                      //       //_placeHprovider.listPlaceHolder          
                                      //       _tprovPreguntas.listaPreguntas [index]['_id'].toString()                                  

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
                                    ])
                                    ),
                                    padding: EdgeInsets.all(15),
                                  
                                  // child: miCard(
                                  //   tesProv.listTest[index]['name'].toString(),
                                  //   tesProv.listTest[index]['description'].toString()
                                  //   ),
                                  
                                    child: Column(
                                      children: [
                                        
                                        Text(
                                          
                                        '¿'+_tprovPreguntas.listaPreguntas[index]['name']+'?',
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
        
      ),
    );
  }





  
  }//fin build





