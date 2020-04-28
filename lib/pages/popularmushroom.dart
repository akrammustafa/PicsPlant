import 'package:flutter/material.dart';

import 'home_page.dart';

class Mostpopularmushroom extends StatelessWidget {
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
            "10 Types of Popular Mushrooms\n",
            style: TextStyle(fontSize: 20.0),
            ),
          ),),
          Container(
            child: Align(alignment: Alignment(-1, 0),child: Text("1. White Button Mushroom :"),)
          ),
          Container(child: Image.asset('assets/mostpopular/button-mushroom.jpg',height: 150,width: 200,),),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate names: able mushroom, cultivated mushroom, button, champignon (de Paris)"),) ,),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Characteristics: The most common and mildest-tasting mushroom around. Ninety percent of the mushrooms we eat are this variety. Less intensely flavored than many of its more exotic kin, it can be eaten either raw or cooked, and works well in soups and salads, and on pizzas.\n"),) ,),
          Container(
              child: Align(alignment: Alignment(-1, 0),child: Text("2. Crimino Mushroom (Crimini, pl.) :"),)
          ),
          Container(child: Image.asset('assets/mostpopular/cremini-mushrooms.jpg',height: 150,width: 200,),),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate names: Cremini, baby bellas, golden Italian mushrooms, Roman, classic brown, Italian brown, brown mushrooms"),) ,),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Characteristics: A crimino is a young portobello. Although the crimino is darker, firmer and more flavorful than its cousin the white button mushroom, the two can be used interchangeably.\n"),)),
          Container(
              child: Align(alignment: Alignment(-1, 0),child: Text("3. Portabello Mushroom"),)),
          Container(child: Image.asset('assets/mostpopular/portobello-mushrooms.jpg',height: 150,width: 200,),),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate Names: Portobella, field mushroom, open cap mushroom"),) ,),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Characteristics: Common in Italian cooking, dense, rich portobellos lend depth to sauces and pastas and make a great meat substitute. When portabellos are young and small, they're called criminis. If you want a bun-substitute, you can even use the mushroom's flat cap. Mushrooms of this variety are as wide as the palm of your hand, and their meaty texture stands up to grilling and stuffing.\n"),)),
          Container(
              child: Align(alignment: Alignment(-1, 0),child: Text("4. Shiitake Mushroom"),)
          ),
          Container(child: Image.asset('assets/mostpopular/shiitake-mushrooms.jpg',height: 150,width: 200,),),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate names: able mushroom, cultivated mushroom, button, champignon (de Paris)"),) ,),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate Names: Shitake, black forest, black winter, brown oak, Chinese black, black mushroom, oriental black, forest mushroom, golden oak, Donko.\n"),)),
          Container(
              child: Align(alignment: Alignment(-1, 0),child: Text("5. Maitake Mushroom"),)
          ),
          Container(child: Image.asset('assets/mostpopular/maitake-mushrooms.jpg',height: 150,width: 200,),),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Alternate Names: Hen of the Wood, sheepshead mushroom, ram's head, kumotake, dancing mushroom"),)),
          Container(child: Align(alignment: Alignment(-1, 0),child: Text("Characteristics: From afar, this mushroom can look like a head of cabbage. Cultivated, as well as found in the woods, these mushrooms are often sold in clusters with their soft, feathery caps overlapping. This mushroom has an earthy aroma and a gamy flavor, and is native to both the northwestern United States and Japan. They grow wild east of the Mississippi River in August and September.\n"),)),
        ],)
    );
  }
}
