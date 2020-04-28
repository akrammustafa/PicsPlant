
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;

class TFLiteProvider  {

  String _path;

  TFLiteProvider(
      {String path}
      ): this._path = path;

  dynamic model;
  List<String> paths;

  Future<List<dynamic>> predict() async {
    return _predictImage(_path);
  }

  Future<List<dynamic>> _predictImage(String path) async {

    List<dynamic> willReturn = new List<dynamic>();

    try{
      model = await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/results.txt",
      );

    }catch(e){

      // add error to list
      willReturn.add("Error : " + e.toString());
      print("Error: " + e.toString());
    }

    if (willReturn.length != 0)
      return willReturn;
    else{

      try{
        var imageBytes = (await rootBundle.load(path)).buffer;
        img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
        img.Image resizedImage = img.copyResize(oriImage,width: 224, height: 224);

        return  Tflite.runModelOnBinary(
          binary: _imageToByteListFloat32(resizedImage, 224, 127.5, 127.5),
        );
      }catch(e){
        print("Error : " + e.toString());
      }


    }


  }

  Uint8List _imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

}