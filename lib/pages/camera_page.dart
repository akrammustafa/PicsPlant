  import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imrichapp/ml/tflite_provider.dart';
import 'package:imrichapp/res/colors.dart' as MColors;

class CameraPage extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraPage> {

  List<dynamic> _results;

  bool startPredict = false ;

  String _path;

  Future getImage(ImageSource mSource) async {
    startPredict = false;
    File imageFile = await ImagePicker.pickImage(source: mSource);

    print("Selected image path : " + imageFile.path.toString());

    setState(() {
      _path = imageFile.path;
    });

  }

  Future<List<dynamic>> _predict() async {

        final result = await TFLiteProvider(path: _path).predict();
        setState(() {
          _results = result;
        });

  }




  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Material(
      child: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                width: double.maxFinite,
                height: _height * ( 2 / 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black87.withOpacity(0.2)),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                   child: _path == null ?
                   Image.asset( "assets/images/placeholder.png",fit: BoxFit.fill)
                       : Image.file(
                       File(_path),
                       fit: BoxFit.cover,
                     filterQuality: FilterQuality.high,),
                ),
              ),

              /// buttons block
              Padding(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    /// identify image button
                    SizedBox(
                      width: _width * (2.2/5),
                      height: 48,
                      child: RaisedButton(
                        color: MColors.main_green,
                        child: Text("Identify Image", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          if(_path != null)
                              _predict();
                          else{
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  content: Text("\nPlease select an image..", style: TextStyle(color: Colors.black87, fontSize: 18),),
                                  actions: <Widget>[
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("OK", style: TextStyle(color: MColors.main_green,),),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ));
                          }
                        },
                      ),
                    ),
                    /// select image form gallery
                    GestureDetector(
                      onTap: (){
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                          width:  _width * (1/5),
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Image.asset("assets/images/image_pick_gallery.png")),
                    ),
                    /// select image from camera
                    GestureDetector(
                      onTap: (){
                          getImage(ImageSource.camera);
                      },
                      child: Container(
                          width:  _width * (1/5),
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Image.asset("assets/images/camera_icon.png")),
                    ),

                  ],
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black87.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: _results != null ? ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index){
                        return Text.rich(
                            TextSpan(
                                text : "Result ${index + 1}:",
                                style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "\nLabel: ${_results[index]["label"]}",
                                      style: getStyleForResults()
                                  )
                                  ,TextSpan(
                                      text: "\nConfidence: ${_results[index]["confidence"]}",
                                      style: getStyleForResults()
                                  )
                                ]
                            )
                        );
                      }) : Text("Results will be here.. ")
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  TextStyle getStyleForResults(){
    return TextStyle( color:  Colors. black54, fontSize: 15);
  }
}
