
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imrichapp/pages/camera_page.dart';
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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      title: _title,
      //home: CameraPage(),
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
    CameraPage(),
    mashroomPage(),
    information_page(),

  ];

  void _onItemTapped(int index) {

    setState(() {

      _selectedIndex = index;

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
              icon: Icon(Icons.nature),
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

