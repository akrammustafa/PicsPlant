import 'package:flutter/material.dart';
class information_page extends StatefulWidget {
  @override


  _HomeState createState() => _HomeState();
}

class _HomeState extends State<information_page> {

  Widget build(BuildContext context) {


        return Column(children: <Widget>[
        Container(

        child: Text("How it Works?", style: TextStyle(color: Colors.orange,fontSize: 15),),
        ),
        Container(
        child: Text("To identify a plant you simply need to simply take a photo of the plant, and the app will tell you what it is in a matter of seconds!"
        "PicsPlant can currently recognize 80% of all known species of plants and trees, which covers most of the species you will encounter in every country on Earth."
        ),
        ),
        Container(child: Image.asset('assets/images/info.jpg'),),
        Container(

        child: new Text("For more information, please contact us"),
        ),
        Container(child : new Text("PicsPlant@gmail.com"),
        ),




        ]);


      }
    }
