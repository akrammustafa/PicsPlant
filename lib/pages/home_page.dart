import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imrichapp/pages/floweroftheweek.dart';
import 'package:imrichapp/pages/howtodetec.dart';
import 'package:imrichapp/pages/popularmushroom.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  TextEditingController _editTextController;

  @override
  void initState() {
    super.initState();
    _editTextController = new TextEditingController();
  }

  Future openInBrowser()async{
    String fixedQueryString = _editTextController.text.replaceAll(" ", "%20");
    String query = "http://google.com/search?q=" + fixedQueryString;
    await launch(
        query,
        forceWebView: true,
        forceSafariVC: false);
  }

  @override
  Widget build(BuildContext context) {
    return  new ListView(children: <Widget>[
          new Container(
            width: double.maxFinite,
            height: 56.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Row(children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextField(
                      cursorColor: Color(0xFFFFFFFF),
                      controller: _editTextController,
                      decoration: InputDecoration.collapsed(hintText: " Search a plant...  "),),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(right : 12.0),
                child: GestureDetector(
                    onTap: ()=> openInBrowser(),
                    child: Icon(Icons.search,color: Colors.orangeAccent,)),
              )
            ],)
          ),
              Container(
          height: 100,
          child:
        Center(child:
               Text(" Welcome to PicsPlant",style: GoogleFonts.dancingScript(
               textStyle: TextStyle(
                color: Colors.orange,
                fontSize: 28,
                   fontWeight: FontWeight.bold)),),
            ),),
              Container(
          height: 50,
          child:Center(child:
          Text(" Identfy the Plant World",style: GoogleFonts.dancingScript(
          textStyle: TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold)),),
          )),

      Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.favorite_border,color: Colors.red,),
                title: Text('The Flower of the week ',style: TextStyle(color: Colors.amber)),
                subtitle: Text('Asters are beautiful perennials that are found wild in North America and southern Europe. The genus Aster includes some 600 species of widely distributed flowering plants in the family Asteraceae...'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Read More'),
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Floweroftheweek()),
                    );},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.search,color: Colors.green,),
                title: Text('How plants are detected ?',style: TextStyle(color: Colors.amber)),
                subtitle: Text('Image recognition is a computer vision task that works to identify and categorize various elements of images and/or videos. Image recognition models are trained to take an image...'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Read More'),
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HowPlantsDetected()),
                    );},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


      Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.blur_circular,color: Colors.yellow,),
                title: Text('Most Popular Muhsrooms ',style: TextStyle(color: Colors.amber),),
                subtitle: Text('Here, we take a look at the flavor profiles and characteristics of the most popular mushroom varieties.\n1. White Button Mushroom...'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Read More'),
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mostpopularmushroom()),
                    );
                      },
                  ),
             //WillPopScope//
                ],
              ),

            ],
          ),
        ),
      ),

      ]);
  }
}
