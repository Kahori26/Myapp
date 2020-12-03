import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:seni/paint/models/strokes_model.dart';
//import 'package:seni/paint/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'package:seni/savepaint/capture.dart';
import 'package:seni/paint/screens/paper_screen.dart';
import 'package:seni/paint/models/save_paint_model.dart';

class SavePaintPage extends StatefulWidget {
  //final Image image;
  //SavePaintPage({this.image});
  @override
  //_SavePaintPageState createState({Image image}) =>
  //    _SavePaintPageState(image: image);

  _SavePaintPageState createState() => _SavePaintPageState();
}

//class SavePaintPage extends StatelessWidget {
class _SavePaintPageState extends State<SavePaintPage> {
  @override
  Widget build(BuildContext context) {
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
              TextSpan(text: '  ぬりえ保存一覧 '),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(Icons.brush_outlined),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Container(
        //color: Colors.yellow,
        child: _PaintList(),
      ),
      //savepaint.add(_image)
    );
  }
}

class _PaintList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var saveimage = context.watch<SavePaintModel>();
    final Size size = MediaQuery.of(context).size;
    //var index;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: saveimage.images.length,
      itemBuilder: (context, index) => Card(
        //children:<Widget>[

        /*leading: saveimage.images[index] != null
            ? saveimage.images[index]
            : Container(),*/
        child: saveimage.images[index] != null
            ? saveimage.images[index]
            : Container(),

        //),
      ),
    );
  }
}
/*
class Item {
  Image image;
  int id;

  Item(this.image, this.id);
}
*/
/*
class PaintList {
  final List<Offset> points = [];
  //final Color color;
  //final double width;
  final Image image;

  PaintList(this.image);
  //Stroke(this.color);
  //Stroke(this.width);

  add(Image image) {
    points.add(image);
  }
}
*/
