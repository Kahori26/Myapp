import 'package:flutter/material.dart';
import 'package:seni/paint/models/strokes_model.dart';
import 'package:seni/paint/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'package:seni/savepaint/savepaintpage.dart';
import 'package:seni/paint/models/save_paint_model.dart';
import 'package:seni/paint/models/palette_model.dart';

import '../models/pen_model.dart';

class PaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final image = Provider.of<SavePaintModel>(context);
    //SavePaintModel image;
    //Image image;
    //image = null;
    final String image = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        //leading: Icon(Icons.arrow_back_ios),
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
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(Icons.brush_outlined),
                ),
              ),
            ],
          ),
        ),
      ),*/
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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PenModel(),
            //builder: (BuildContext context) => PenModel(),
          ),
          /*ChangeNotifierProvider(
          create: (context) => PenWidthModel(),
          //builder: (BuildContext context) => PenModel(),
        ),*/
          ChangeNotifierProvider(
            create: (context) => StrokesModel(),
            //builder: (BuildContext context) => StrokesModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => SavePaintModel(),
            //builder: (BuildContext context) => StrokesModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaletteModel(),
            //builder: (BuildContext context) => StrokesModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          home: SafeArea(
            child: PaperScreen(name: image),
          ),
          //home: PaperScreen(),

          routes: <String, WidgetBuilder>{
            '/SavePaintListPage': (BuildContext context) => new SavePaintPage(),
          },
        ),
      ),
    );
  }
}
