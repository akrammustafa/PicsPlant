
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SearchPage> {

  List<String> paths;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future getImages() async {
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.jpg'))
        .toList();

    setState(() {
      paths = imagePaths;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: paths == null ? 0 : paths.length ,
        itemBuilder: (context, index){
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
                          child: Image.asset(paths[index])),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Text("Header"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Text("bla"),
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