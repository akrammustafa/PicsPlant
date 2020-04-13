
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imrichapp/res/colors.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: main_green,
        boxShadow: [
          BoxShadow(
          color: Colors.blueGrey,
          blurRadius: 10, // has the effect of softening the shadow
          spreadRadius: 1, // has the effect of extending the shadow
          offset: Offset(
            0,// horizontal, move right 10
            2.5, // vertical, move down 10
          ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: SizedBox(
                width: 39,
                  height: 45,
                  child: Image.asset("assets/logo.PNG"))
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("PicsPlant",style:GoogleFonts.dancingScript(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),),
          )
        ],
      ),
    );
  }

}
