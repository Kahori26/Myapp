import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
//使わないかも
//
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
      _doCapture(_image,_globalKey),
      //Navigator.of(context).pushNamed("/SavePaintList"),
    );
  }

  /*
   * キャプチャ開始
   */
  Future<Null> _doCapture(Image _image,GlobalKey _globalKey) async {
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
