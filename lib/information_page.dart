import 'package:flutter/material.dart';
class information_page extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<information_page> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[
              Container(
              child: new Text("For more information, please contact us"),
            ),
            Container(child : new Text("PicsPlant@Gmail.com"),
            ),
            ]);


  }
}