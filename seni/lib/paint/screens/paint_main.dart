import 'package:flutter/material.dart';
import 'package:seni/paint/models/strokes_model.dart';
import 'package:seni/paint/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'package:seni/savepaint/savepaintpage.dart';

import '../models/pen_model.dart';

class PaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: PaperScreen(),
        ),
        routes: <String, WidgetBuilder>{
          '/SavePaintList': (BuildContext context) => new SavePaintPage(),
        },
      ),
    );
  }
}
