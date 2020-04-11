import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  new Column(children: <Widget>[
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/sedir.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/sandal.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/servi.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/amanita3.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/1.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/2.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/96.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image : new AssetImage("assets/images/amanita1.jpg"),
                      height: 200.0,
                      width:  200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              


              ],
            ),
          ),
      Container(
          height: 100,
          child:
        Center(child:
        Text("Welcome To PicsPlant",style: TextStyle(fontSize: 34,color:Colors.deepOrange),)),

      ),
        Container(
        height: 50,
            child:
        Center(child:
        Icon(Icons.search,color: Colors.orange))

          ),
        Container(
          height: 50,
          child:
          Center(child:
          Text("Identify The Plant World ",style: TextStyle(fontSize: 20,color:Colors.green))),
        )],
      );
  }
}
