
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class mashroomPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<mashroomPage> {

  List<String> _paths;
  List<String> _lines;

  @override
  void initState() {
    super.initState();
    print("In State !");
    getImages();
  }

  Future getImages() async {
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // for image paths
    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('mushrooms/'))
        .where((String key) => key.contains('.jpg'))
        .toList();

    // for file paths
    final filePaths = manifestMap.keys
        .where((String key) => key.contains('files/'))
        .where((String key) => key.contains('mushrooms.txt'))
        .toList();

    List<String> files = filePaths;

    // read file content
    String fileContent = await rootBundle.loadString(files[0]);

    // split content to lists foreach line
    List<String> lines = fileContent.split("\n");
    lines.forEach((element) { print("Line : " + element);});

    setState(() {
      _paths = imagePaths;
      _lines = lines;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _paths == null ? 0 : _paths.length ,
        itemBuilder: (context, index){

          List<String> splittedLine = _lines[index].split(",");
          String header = splittedLine[0];
          String desc = splittedLine[1];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff707070),
                      width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0)),
                    child: SizedBox(
                      width: 99,
                      height: 99,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(_paths[index])),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Text(header),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Text(desc),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }

    );
  }
}