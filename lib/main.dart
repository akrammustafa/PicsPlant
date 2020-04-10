
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imrichapp/information_page.dart';
import 'package:imrichapp/home_page.dart';
import 'package:imrichapp/search_page.dart';
import 'package:imrichapp/share_page.dart';
void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  File _image;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[

    HomePage(),
    SearchPage(),
    null,
    SharePage(),
    information_page(),

  ];

  void _onItemTapped(int index) {

    setState(() {

      _selectedIndex = index;

    });
    if(index==2){

      showDialog(context: context,builder:(context){
        return AlertDialog(
          title:Text("Camera or Gallery"),
          content: Row(
            children: <Widget>[
              IconButton(icon:Icon(Icons.camera_enhance), onPressed:()=> getImage(ImageSource.camera)),

              IconButton(icon:Icon(Icons.photo), onPressed: ()=> getImage(ImageSource.gallery))

            ],
          ),
        );
      });
      return null;}
  }
  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);

    setState(() {

      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PicsPlant'),

        backgroundColor: Colors.lightGreen,
      ),

      body: Center(

        child: _image==null?_widgetOptions.elementAt(_selectedIndex):Image.file(_image),

      ),


      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),


            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            title: Text('Plants'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            title: Text('Share'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Info'),

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[900],
        onTap: _onItemTapped,

      ),
    );
  }
}

