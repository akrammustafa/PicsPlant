
import 'package:flutter/material.dart';

class mashroomPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<mashroomPage> {
  @override
  Widget build(BuildContext context) {
    var text;
    return Column(children: <Widget>[
      
      Container(
        child: Text("Information About PicsPlant",style: TextStyle(fontSize: 40,color: Colors.lightGreen),),
      ),
      Container(
        child: Text("This app allows capturing images with a smartphone camera and identificate it by ... "
            "",style: TextStyle(fontSize: 20,color: Colors.purple),),
      ),
      Container(
        child: Text("How it works"
            "",style: TextStyle(fontSize: 10,color: Colors.purple),),
      ),
    ],);
    
 

  }
}