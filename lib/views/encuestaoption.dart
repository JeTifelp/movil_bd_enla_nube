import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/placeholder.dart';

class EncuestaOption extends StatefulWidget {
  // final int val1;
  // final String val2;
  // final String val3;
  final  List<Placeholder1> listObj;

  EncuestaOption(this.listObj,{Key key}) : super(key: key);

  @override
  

  _EncuestaOptionState createState() => _EncuestaOptionState();
}



class _EncuestaOptionState extends State<EncuestaOption> {
  
  @override
  Widget build(BuildContext context)=> Scaffold(
    extendBodyBehindAppBar: true,
    appBar:  AppBar(
      title: Text("HomePage"),
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
    body: Center(
      // child: Image.network(
      //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwkG4eBfmS9dXObhY0NTWp1QLqOmlw76MLGg&usqp=CAU',
      //   fit:  BoxFit.cover,
      //   width: double.infinity,
      //   height: double.infinity,
      // ),
      child:  Text(widget.listObj[0].id.toString()+'__'+widget.listObj[0].title+'__'+widget.listObj[0].body),
    ),
    
  

  );
}