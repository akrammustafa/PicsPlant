
import 'dart:async';
import 'package:universal_io/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SearchPage> {

  List<String> paths;


    Future getImagesAsList() async {
    print("In GetImage !");
    print("In GetImage !");

    paths = new List<String>();
    try{

      final dir = new Directory("");

      List<FileSystemEntity> list = dir.listSync();
      print("Item : " + list[0].path );
      /*dir.list().listen((event) {
        print("Path    : " + event.path);
        paths.add(event.path);
      })..cancel();*/
    } catch(e){
      print("Error : "+ e.toString());
    }

  }


  /*
  Future getImagesAsList() async{

    Directory rootPath = await getApplicationDocumentsDirectory();
    print("Path : " + rootPath.path);
  } */

  @override
  void initState() {
    super.initState();

    getImagesAsList();

  }



  @override
  Widget build(BuildContext context) {
    return
      Container(
          child: Image.asset("assets/image/a1.jpg"),
          width : double.maxFinite,
      height : double.maxFinite); 
    
    
    /* ListView.builder(
      itemCount: paths == null ? 0 : paths.length,
      itemBuilder: (context,index){
      return Row(
        children: <Widget>[
          Image.asset(paths[index]),
          Text("Example data")
        ],
      );
    },
    ); */
  }
}

/*
 Container(
          child: Center(
            child: Text("Information about some Plants",style: TextStyle(color: Colors.green)),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),

        ),
        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),
        ),

        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Image(image:
              new AssetImage("image/amanita3.jpg")
                ,height: 100,width: 100,),
              Text("data:jhgjgjhj",style: TextStyle(color: Colors.deepPurpleAccent),),
              Text("data:jhgjgjhj")
            ],
          ),
        )

 */
