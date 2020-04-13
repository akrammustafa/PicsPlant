

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget{

  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStatefulWidget()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Material(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 130,
                  height: 130,
                  child: Image.asset("assets/logo_2.png"),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18, top: 24),
                child: Text("PicsPlant",
                    style: GoogleFonts.dancingScript(
                        textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold)
                    )
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}