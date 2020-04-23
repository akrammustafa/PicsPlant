import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imrichapp/pages/home_page.dart';

import 'floweroftheweek.dart';

class HowPlantsDetected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(children: <Widget>[
        Container(
         child: Align(alignment:Alignment(-1, 0),child:
         RaisedButton(onPressed:(){Navigator.pop(
           context,
           MaterialPageRoute(builder: (context) => HomePage()),
         );},child: Icon(Icons.arrow_back)),),

        )
      ],)
    );
  }
}
