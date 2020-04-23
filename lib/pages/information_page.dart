import 'package:flutter/material.dart';
class information_page extends StatefulWidget {
  @override
  String text='ddjhskdjhskjfhksdjfhksjdhfkjsfhksjhfkjdshfkjsdhfkjsdhfkjshdkhkshfkshkdggggggggggggggggggggggggggggggggggggggggggggggggggggjhfksjdfhfujwkdsghskdjghksjdhgksjdhkgjhskdjghkdsjhgksjhdgksdh';
  bool isExpanded=false;

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<information_page> {

  Widget build(BuildContext context) {


        return Column(children: <Widget>[
        Container(

        child: Text("How it Works?", style: TextStyle(color: Colors.orange),),
        ),
        Container(
        child: Text("To identify a plant you simply need to simply take a photo of the plant, and the app will tell you what it is in a matter of seconds!"
        "PicsPlant can currently recognize 80% of all known species of plants and trees, which covers most of the species you will encounter in every country on Earth."
        ),
        ),
        Container(

        child: new Text("For more information, please contact us"),
        ),
        Container(child : new Text("PicsPlant@Gmail.com"),
        ),

          Column(children: <Widget>[
            new ConstrainedBox(
                constraints: widget.isExpanded
                    ? new BoxConstraints()
                    : new BoxConstraints(maxHeight: 50.0),
                child: new Text(
                  widget.text,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                )),
                widget.isExpanded
                ? new Container()
                : new FlatButton(
                child: const Text('...'),
                onPressed: () => setState(() => widget.isExpanded = true))
          ])



        ]);


      }
    }
