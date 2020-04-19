import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          child:
          Text(" Identfy the Plant World",style: GoogleFonts.dancingScript(
          textStyle: TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold)),),
          ),


      Container(
        height: 100,
        child:
        Row(children: <Widget>[
          Image.asset("assets/plant/1.jpg"),
          Text("Flower of the week"),


        ],)
      ),

      Container(

          height:100,
          child:
          Row(children: <Widget>[
            Image.asset("assets/plant/3.jpg"),
            Text("How to Identify Plants"),


          ],)
      ),

      Container(

          height:100,
          child:
          Row(children: <Widget>[
            Image.asset("assets/mushrooms/5.jpg"),
            Text("Most popular mushrooms"),


          ],)
      ),

      ],
      );
  }
}
