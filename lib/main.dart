// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//paint機能のため追加
//import 'package:seni/paint/models/strokes_model.dart';
import 'package:seni/paint/screens/paint_main.dart';
import 'package:provider/provider.dart';
//import 'paint/models/pen_model.dart';
import 'package:seni/savepaint/savepaintpage.dart';
import 'package:seni/paint/models/save_paint_model.dart';
//import 'package:provider/provider.dart';
import 'package:seni/select/paint_select.dart';
import 'package:seni/paint/camera/photo.dart';
import 'package:seni/paint/camera/color.dart';
import 'package:seni/savepaint/selectimagepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final image = Provider.of<SavePaintModel>(context);
    //SavePaintModel image;
    return ChangeNotifierProvider(
      create: (context) => SavePaintModel(),

      //child: MyApp(),

      child: MaterialApp(
        home: TopPage(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/top': (BuildContext context) => new TopPage(),
          '/Main': (BuildContext context) => new MainPage(),
          '/Paint': (BuildContext context) => new PaperApp(),
          '/SavePaintListPage': (BuildContext context) => new SavePaintPage(),
          '/PicSelect': (BuildContext context) => new PicSelect(),
          '/PaintPage': (BuildContext context) => new PaperApp(),
          '/photo': (BuildContext context) => new GetImagePage(),
          '/color': (BuildContext context) => new Findcolorpage(),
          '/SelectImagePage': (BuildContext context) => new SelectImagePage(),
        },
      ),
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            'images/main.png',
            // width: 420,
            fit: BoxFit.cover,
          ),
          new Align(
            alignment: new Alignment(0.0, 1.0),
            child: Container(
              margin: new EdgeInsets.only(bottom: 195.0),
              child: new SizedBox(
                width: 200,
                height: 50,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,

                  // materialTapTargetSize: MaterialTapTargetSize(),
                  onPressed: () => Navigator.of(context).pushNamed("/Main"),

                  child: Text(
                    "  スタート  ",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override

//appbarの関数化　戻るボタンの遷移場所の変数
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //ぬりえのアイコン

                SizedBox.fromSize(
                  //size: Size(400, 150), // button width and height
                  size: Size(size.width, size.height / 4),
                  //child: ClipOval(
                  child: Material(
                    color: Colors.pink[200], // button color
                    child: InkWell(
                      splashColor: Colors.red, // splash color
                      //onTap: () => Navigator.of(context)
                      //    .pushNamed("/subpage"), // button pressed
                      onTap: () =>
                          Navigator.of(context).pushNamed("/PicSelect"),
                      //遷移先のクラス名（ぬりえへ）

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.color_lens_outlined,
                              color: Colors.black, size: 80), // icon
                          Text(
                            "ぬりえ",
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ), // text
                        ],
                      ),
                      // ),
                    ),
                  ),
                ),
                /*Container(
                  margin: EdgeInsets.all(5),
                ),*/
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox.fromSize(
                  //size: Size(400, 150), // button width and height
                  size: Size(size.width, size.height / 4),
                  //child: ClipOval(
                  child: Material(
                    color: Colors.deepOrangeAccent, // button color
                    child: InkWell(
                      splashColor: Colors.orange[200], // splash color
                      onTap: () =>
                          Navigator.of(context).pushNamed("/SavePaintListPage"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.photo_library,
                              color: Colors.black, size: 80),
                          Text(
                            "かこのぬりえ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ), // text
                        ],
                      ),
                    ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
/*
                    Container(
                      margin: EdgeInsets.all(40),
                    ),

 */
          /*Container(
                  margin: EdgeInsets.all(5),
                ),*/
          Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox.fromSize(
                  //size: Size(400, 150), // button width and height
                  size: Size(size.width, size.height / 4),
                  //  child: ClipOval(
                  child: Material(
                    color: Colors.lightBlueAccent, // button color
                    child: InkWell(
                      splashColor: Colors.blue, // splash color
                      onTap: () => Navigator.of(context).pushNamed("/photo"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.photo_camera_outlined,
                              color: Colors.black, size: 80), // icon
                          Text(
                            "いろあつめ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }
}

void app() {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.of(context).pushNamed("/main"),
          ),
        ],
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 4.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
              TextSpan(text: ' GO'),
            ],
          ),
        ),
      ),
    );
  }
}
