import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imrichapp/pages/home_page.dart';

import 'floweroftheweek.dart';

class HowPlantsDetected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child:ListView(children: <Widget>[
          Container(
            child: Align(alignment:Alignment(-1, 0),child:
            RaisedButton(onPressed:(){Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );},child: Icon(Icons.arrow_back)),),

          ),
          Container(child:
          Center(
            child: Text(
              "Plants Identify\n",
              style: TextStyle(fontSize: 20.0,color: Colors.orange),
            ),
          ),),

          Card(
            color: Colors.blueGrey,child: Column(children: <Widget>[
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("                                      What is image recognation?",style: TextStyle(color: Colors.black,fontSize: 15)),)),
            Container(child: Image.asset('assets/images/image_recogntion_how.jpg',height: 250,width: 300,),),
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("Image recognition is a computer vision task that works to identify and categorize various elements of images and/or videos."),) ,),
            Container(child: Align(alignment: Alignment(-1, 0),child: Text("Image recognition models are trained to take an image as input and output one or more labels describing the image. The set of possible output labels are referred to as target classes. Along with a predicted class, image recognition models may also output a confidence score related to how certain the model is that an image belongs to a class.\n"),) ,),

          ],),),

          Card(
            color: Colors.blueGrey,
            child: Column(children: <Widget>[
              Container(
                  child: Align(alignment: Alignment(-1, 0),child: Text("Why image recognation is important?",style: TextStyle(color: Colors.black,fontSize: 15)),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Image recognition is one of the most foundational and widely-applicable computer vision tasks."),) ,),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Recognizing image patterns and extracting features is a building block of other, more complex computer vision techniques (i.e. object detection, image segmentation, etc.), but it also has numerous standalone applications that make it an essential machine learning task.\n"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Image recognition’s broad and highly-generalizable functionality can enable a number of transformative user experiences, including but not limited to:"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text(" • Automated image organization\n • User-generated content moderation\n • Enhanced visual searchutomated photo and video tagging\n • Interactive marketing/Creative campaigns"),),),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Of course, this isn’t an exhaustive list, but it includes some of the primary ways in which image recognition is shaping our future.",),)),


            ],),
            ),

          Card(
            color: Colors.blueGrey,
            child: Column(children: <Widget>[
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Basic Structure",style: TextStyle(color: Colors.black,fontSize: 15),),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("In general, deep learning architectures suitable for image recognition are based on variations of convolutional neural networks (CNNs). For a gentle introduction to CNNs, check out this overview."),) ,),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Nearly all image recognition models begin with an encoder. Encoders are made up of blocks of layers that learn statistical patterns in the pixels of images that correspond to the labels they’re attempting to predict. High performing encoder designs featuring many narrowing blocks stacked on top of each other provide the “deep” in “deep neural networks”. The specific arrangement of these blocks and different layer types they’re constructed from will be covered in later sections.\n"),)),
              Container(child: Image.asset('assets/images/cnn.jpg',height: 350,width: 400,),),
            ],),),

          Card( color: Colors.blueGrey,
            child: Column(children: <Widget>[
              Container(
                  child: Align(alignment: Alignment(-1, 0),child: Text("How image recognition works on the edge?",style: TextStyle(color: Colors.black,fontSize: 15)),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("If your use case requires that image recognition work in real-time, without internet connectivity, or on private data, you might be considering running your image recognition model directly on an edge device like a mobile phone or IoT board."),) ,),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("In those cases, you’ll need to choose specific model architectures to make sure everything runs smoothly on these lower power devices. Here are a few tips and tricks to ensure your models are ready for edge deployment:\n"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Prune your network to include fewer convolution blocks. Most papers use network architectures that are not constrained by compute or memory resources. This leads to networks with far more layers and parameters than are required to generate good predictions.\n"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Add a width multiplier to your model so you can adjust the number of parameters in your network to meet your computation and memory constraints. The number of filters in a convolution layer, for example, greatly impacts the overall size of your model. Many papers and open-source implementations will treat this number as a fixed constant, but most of these models were never intended for mobile use. Adding a parameter that multiplies the base number of filters by a constant fraction allows you to modulate the model architecture to fit the constraints of your device. For some tasks, you can create much, much smaller networks that perform just as well as large ones\n"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Shrink models with quantization, but beware of accuracy drops. Quantizing model weights can save a bunch of space, often reducing the size of a model by a factor of 4 or more. However, accuracy will suffer. Make sure you test quantized models rigorously to determine if they meet your needs.\n"),)),
              Container(child: Align(alignment: Alignment(-1, 0),child: Text("Input and output sizes can be smaller than you think! If you’re designing a photo organization app, it’s tempting to think that your image recognition model needs to be able to accept full resolution photos as an input. In most cases, edge devices won’t have nearly enough processing power to handle this. Instead, it’s common to train image recognition models at modest resolutions, then downscale input images at runtime.\n"),)),

            ],),

          ),

        ],)
    );
  }
}
