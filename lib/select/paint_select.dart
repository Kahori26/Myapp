import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:seni/paint/screens/paint_main.dart';

class PicSelect extends StatelessWidget {
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
              TextSpan(text: '  ぬりえ '),
              TextSpan(
                  text: 'de',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 4.0,
                    fontSize: 30,
                  )
                  //color:Colors.red　でテキストの色変える
                  //decoration: TextDecoration.underlineで下線
                  //overlineで上線
                  //decorationColorで河川の色
                  ),
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
      body: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/PaintPage': (BuildContext context) => new PaperApp(),
        },
        home: GridView.count(
            padding: EdgeInsets.all(4.0),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0, // 縦
            mainAxisSpacing: 10.0, // 横
            childAspectRatio: 0.7, // 高さ

            children: <Widget>[
              RaisedButton(
                // alignment: Alignment.center,
                //decoration: BoxDecoration(
                color: Colors.white,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context)
                    .pushNamed("/PaintPage", arguments: 'images/pain1.png'),
                child: Image.asset(
                  'images/pain1.png',
                  fit: BoxFit.cover,
                ),
              ),
              RaisedButton(
                // alignment: Alignment.center,
                //decoration: BoxDecoration(
                color: Colors.white,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context)
                    .pushNamed("/PaintPage", arguments: 'images/pain2.png'),
                child: Image.asset(
                  'images/pain2.png',
                  fit: BoxFit.cover,
                ),
              ),
              RaisedButton(
                // alignment: Alignment.center,
                //decoration: BoxDecoration(
                color: Colors.white,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context)
                    .pushNamed("/PaintPage", arguments: 'images/pain3.png'),
                child: Image.asset(
                  'images/pain3.png',
                  fit: BoxFit.cover,
                ),
              ),
              RaisedButton(
                // alignment: Alignment.center,
                //decoration: BoxDecoration(
                color: Colors.white,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context).pushNamed("/PaintPage"),
                child: Image.asset(
                  'images/pain1.png',
                  fit: BoxFit.cover,
                ),
              ),
              RaisedButton(
                // alignment: Alignment.center,
                //decoration: BoxDecoration(
                color: Colors.white,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context).pushNamed("/PaintPage"),
                child: Image.asset(
                  'images/pain1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
      ),
    );
  }
}
