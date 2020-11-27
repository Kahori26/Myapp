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
import 'package:seni/savepaint/capture.dart';
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
  Image _image;

  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final Size size = MediaQuery.of(context).size;
    //routes: <String, WidgetBuilder>{

    return Scaffold(
      //routes: <String, WidgetBuilder>{
      //},
      /*appBar: AppBar(
        centerTitle: true,
        title: Text("ぬりえ"),
      ),*/

      body: Stack(
        children: <Widget>[
          //Image.asset('images/sample.jpg', fit: BoxFit.contain),

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
          /*/*
               * キャプチャ表示エリア
               */
          Container(
            color: Colors.yellow,
            height: 200.0,
            child: Center(
              child: _image != null ? _image : Container(),
            ),
          ),*/
          /*
          Align(
            alignment: Alignment.center,
            child: Image.asset("images/ChristmasBear.png", fit: BoxFit.contain),
          ),
*/
          //Paper(),

          Align(
            alignment: Alignment.topLeft,
            child: Palette(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SelectWidth(),
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
                // キャプチャ開始
                _doCapture();
                Navigator.of(context)
                    .pushNamed("/SavePaintListPage", arguments: this._image);
                //SavePaintPage(image: this._image);

                //_navigateToSavePage(context, _image);
                //Navigator.of(context).pushNamed("/SavePaintListPage");
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('削除します'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
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
    //SavePaintPage(image: _image);
    //print(_image);
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
