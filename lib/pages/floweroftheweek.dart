import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Floweroftheweek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child:ListView(children: <Widget>[
          Container(
            child: Align(alignment:Alignment(-1, 0),child:
            RaisedButton(onPressed:(){Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );},child: Icon(Icons.arrow_back)),),

          ),
          Container(child:
          Center(
            child: Text(
              "Flower of the Week\n",
              style: TextStyle(fontSize: 20.0,color: Colors.orange),
            ),
          ),),

          Card(
            color: Colors.blueGrey,child: Column(children: <Widget>[
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("                Aster amellus",style: TextStyle(color: Colors.black,fontSize: 25)),)),
            Container(child: Image.asset('assets/images/aster.jpg',height: 250,width: 300,),),
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("Aster is a genus of perennial flowering plants in the family Asteraceae. Its circumscription has been narrowed, and it now encompasses around 180 species, all but one of which are restricted to Eurasia; many species formerly in Aster are now in other genera of the tribe Astereae. Aster amellus is the type species of the genus and the family Asteraceae.\n"),) ,),
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("Size: Asters range from 1 to 6 feet tall and 1 to 4 feet wide, with some varieties being of indeterminate width.\n"),) ,),
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("Conditions: Most asters perform best in full sun—though some tolerate partial shade, only with fewer blooms and less vigor. (A good choice for shade is the appropriately named wood aster.) Provide asters with well-drained, average to good loamy soil. Wet soil will lead to root rot, and dry sandy soil will cause wilting.\n"),) ,),
          ],),),



        ],)
    );
  }
}
