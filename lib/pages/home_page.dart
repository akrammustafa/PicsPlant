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
    return  new Column(children: <Widget>[
          new Container(
            width: double.maxFinite,
            height: 56.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
            color: Color(0xFFEAECEE),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Row(children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextField(
                      cursorColor: Color(0xFF5D6D7E),
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

          child: SizedBox(
            height: 150,
            width: 150,
            child:Image.network("https://theplantguide.net/wp-content/uploads/2017/08/plant-identification.jpg")
          )
      ),
        Container(
          height: 50,
          child:
          Text(" Identfy plant the world",style: GoogleFonts.dancingScript(
          textStyle: TextStyle(
          color: Colors.orange,
          fontSize: 28,
          fontWeight: FontWeight.bold)),),
          ),],
      );
  }
}
