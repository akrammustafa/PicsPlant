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
    // "bla bla       blabla"
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
                    child: Icon(Icons.search)),
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
                leading: Icon(Icons.style),
                title: Text('The Flower of the week '),
                subtitle: Text('this is the flower jasmin its blabla bla'),
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
                leading: Icon(Icons.search),
                title: Text('How plants are detected ?'),
                subtitle: Text('this is plants and its ala la identufy its blabla bla'),
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
                leading: Icon(Icons.fiber_manual_record),
                title: Text('Most Popular Muhsrooms '),
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
