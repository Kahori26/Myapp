import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override

//appbarの関数化　戻るボタンの遷移場所の変数
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
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //ぬりえのアイコン

                SizedBox.fromSize(
                  size: Size(400, 190), // button width and height

                  //child: ClipOval(
                  child: Material(
                    color: Colors.pink[200], // button color
                    child: InkWell(
                      splashColor: Colors.red, // splash color
                      onTap: () => Navigator.of(context)
                          .pushNamed("/PicSelect"), // button pressed
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
                Container(
                  margin: EdgeInsets.all(5),
                ),

                SizedBox.fromSize(
                  size: Size(400, 190), // button width and height
                  //child: ClipOval(
                  child: Material(
                    color: Colors.deepOrangeAccent, // button color
                    child: InkWell(
                      splashColor: Colors.orange[200], // splash color
                      onTap: () =>
                          Navigator.of(context).pushNamed("/PicSelect"),
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
/*
                    Container(
                      margin: EdgeInsets.all(40),
                    ),

 */
                Container(
                  margin: EdgeInsets.all(5),
                ),
                SizedBox.fromSize(
                  size: Size(400, 190), // button width and height
                  //  child: ClipOval(
                  child: Material(
                    color: Colors.lightBlueAccent, // button color
                    child: InkWell(
                      splashColor: Colors.blue, // splash color
                      onTap: () => Navigator.of(context)
                          .pushNamed("/PicSelect"), // button pressed
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
        ],
      ),
    );
  }
}
