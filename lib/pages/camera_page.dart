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
    File imageFile = await ImagePicker.pickImage(source: mSource);

    print("Selected image path : " + imageFile.path.toString());

    setState(() {
      _path = imageFile.path;
    });

  }

  Future<List<dynamic>> _predict() async {

    if(_path == null){
        print("Image does not exist !");
    }else{
      print("Before prediction !");
      return TFLiteProvider(path: _path).predict();
    }
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

              /// Future
              Visibility(
                visible: false,
                child: FutureBuilder(
                  future: startPredict ? _predict() : null,
                  builder: (context, snapshot){

                    print("OnResults !");

                    setState(() {
                      _results = snapshot.data;
                    });
                    return SizedBox.shrink();
                  },
                ),
              ),

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
                  child: Image.asset(
                    _path == null ? "assets/images/placeholder.png" : _path,
                    fit: BoxFit.fill,
                  ),
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

                          print("Identify clicked !");
                          setState(() {
                            startPredict = true;
                          });
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

              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                width: double.maxFinite,
                height: _height * ( 2 / 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black87.withOpacity(0.2)),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: _results == null ? Text("Results will be here... ")
                  : Text.rich(
                      TextSpan(
                          text: "Results:\n\n",
                          children :<TextSpan> [
                            TextSpan(
                              text : _results.toString() ,
                            ),
                          ]
                      )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
