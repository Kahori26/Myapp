import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:seni/savepaint/savepaintpage.dart';
import 'package:provider/provider.dart';
import 'package:seni/paint/models/save_paint_model.dart';

class SelectImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item _image = ModalRoute.of(context).settings.arguments;
    //SelectImagePage(image:_image);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 4.0,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Pacifico",
            ),
            children: [
              TextSpan(text: '  ぬりえ '),
              TextSpan(
                  text: 'de',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 4.0,
                    fontSize: 30,
                  )),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(Icons.brush_outlined),
                ),
              ),
              TextSpan(text: ' GO'),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed("/top"),
          )
        ],
      ),
      body: Container(
        //color: Colors.yellow,
        child: ViewSelectImage(image: _image.image),
      ),
      //savepaint.add(_image)
    );
  }
}

class ViewSelectImage extends StatelessWidget {
  final Image image;
  ViewSelectImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: image,
    );
  }
}
