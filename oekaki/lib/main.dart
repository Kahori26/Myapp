import 'package:flutter/material.dart';
import 'package:oekaki/models/strokes_model.dart';
import 'package:oekaki/screens/paper_screen.dart';
import 'package:provider/provider.dart';

import 'models/pen_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      ),
    );
  }
}
