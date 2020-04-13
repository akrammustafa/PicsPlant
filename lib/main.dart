
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imrichapp/pages/information_page.dart';
import 'package:imrichapp/pages/home_page.dart';
import 'package:imrichapp/pages/plants_page.dart';
import 'package:imrichapp/pages/mashroom_page.dart';
import 'package:imrichapp/pages/splash_screen.dart';
import 'package:imrichapp/widgets/custom_app_bar.dart';
void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: SplashScreen(),
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
    plants_page(),
    null,
    mashroomPage(),
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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: CustomAppBar(),
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
              icon: Icon(Icons.show_chart),
              title: Text('Mushroom'),

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
      ),
    );
  }
}

