import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seni/paint/components/selectwidth.dart';
import 'package:provider/provider.dart';
import 'package:seni/paint/components/palette.dart';
import 'package:seni/paint/components/paper.dart';
import 'package:seni/paint/models/strokes_model.dart';
//import 'paint_main.dart';
//import 'package:seni/savepaint/savepaintpage.dart';

//キャプチャのため追加
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
//import 'package:seni/savepaint/capture.dart';
//import 'package:seni/savepaint/savepaintpage.dart';

import 'package:seni/paint/models/save_paint_model.dart';
import 'package:seni/savepaint/savepaintpage.dart';

class PaperScreen extends StatefulWidget {
  @override
  _PaperScreenState createState() => new _PaperScreenState();
}

//class PaperScreen extends StatelessWidget {

class _PaperScreenState extends State<PaperScreen> {
  // グローバルキー
  GlobalKey _globalKey = GlobalKey();
  // イメージ
  //var _image;
  Image _image;

  @override
  Widget build(BuildContext context) {
    var strokes = Provider.of<StrokesModel>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            RepaintBoundary(
              key: _globalKey,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: size.width,
                    height: size.height,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("images/ChristmasBear.png",
                        fit: BoxFit.contain),
                  ),
                  Paper(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,

                // materialTapTargetSize: MaterialTapTargetSize(),

                onPressed: () {
                  print("押したよ");
                  _doCapture();
                },
                child: Text(
                  "  保存  ",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            /*Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_circle_down),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('保存する？'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('キャンセル'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              _doCapture();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),*/
            Align(
              alignment: Alignment.topLeft,
              child: Palette(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SelectWidth(),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "undo",
              onPressed: () {
                if (strokes.canUndo()) strokes.undo();
              },
              child: Text("もどす"),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              heroTag: "redo",
              onPressed: () {
                if (strokes.canRedo()) strokes.redo();
              },
              child: Text("すすむ"),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              heroTag: "save",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('保存する？'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            _doCapture();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("保存"),
              //child: Icon(Icons.arrow_circle_down),
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              child: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('やりなおす？'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            strokes.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ));
  }

  /*
   * キャプチャ開始
   */
  Future<Null> _doCapture() async {
    var image = await _convertWidgetToImage(_globalKey);

    setState(() {
      _image = image;
    });
    /*ChangeNotifierProxyProvider0<SavePaintModel>(
      create: (context) => SavePaintModel(),
      update: (context, saveimage) => saveimage..images.add(_image),
    );*/
    var savepaint = context.read<SavePaintModel>();
    savepaint.add(_image);
    //return Future.value(_image);
    //SavePaintPage(image: _image);
    print("capture");
    //return null;
  }

  /*
   * _globalKeyが設定されたWidgetから画像を生成し返す
   */
  Future<Image> _convertWidgetToImage(GlobalKey _globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      return Image.memory(pngBytes);
    } catch (e) {
      print(e);
    }

    return null;
  }
}
//Navigator
/*void _navigateToSavePage(BuildContext context, Image image) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new SavePaintPage()));
}*/
/*
class Capture extends StatefulWidget {
  @override
  _CaptureState createState() => new _CaptureState();
}

class _CaptureState extends State<Capture> {
  // グローバルキー
  //GlobalKey _globalKey = GlobalKey();
  // イメージ
  //Image _image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      _doCapture(),
      //Navigator.of(context).pushNamed("/SavePaintList"),
    );
  }

  /*
   * キャプチャ開始
   */
  Future<Null> _doCapture() async {
    var image = await _convertWidgetToImage(_globalKey);

    setState(() {
      _image = image;
    });
  }

  /*
   * _globalKeyが設定されたWidgetから画像を生成し返す
   */
  Future<Image> _convertWidgetToImage(GlobalKey _globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      return Image.memory(pngBytes);
    } catch (e) {
      print(e);
    }

    return null;
  }
}

*/
