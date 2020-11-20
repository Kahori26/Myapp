import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seni/paint/components/selectwidth.dart';
import 'package:provider/provider.dart';
import 'package:seni/paint/components/palette.dart';
import 'package:seni/paint/components/paper.dart';
import 'package:seni/paint/models/strokes_model.dart';
//import 'paint_main.dart';
//import 'package:seni/savepaint/savepaintpage.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    //routes: <String, WidgetBuilder>{

    return Scaffold(
      //routes: <String, WidgetBuilder>{
      //},
      appBar: AppBar(
        centerTitle: true,
        title: Text("ぬりえ"),
      ),
      body: Stack(
        children: <Widget>[
          //Image.asset('images/sample.jpg', fit: BoxFit.contain),

          Align(
            alignment: Alignment.center,
            child: Image.asset("images/ChristmasBear.png", fit: BoxFit.contain),
          ),

          Paper(),

          Align(
            alignment: Alignment.topLeft,
            child: Palette(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SelectWidth(),
          ),

          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,

            // materialTapTargetSize: MaterialTapTargetSize(),
            onPressed: () => Navigator.of(context).pushNamed("/SavePaintList"),

            child: Text(
              "  保存  ",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
}
