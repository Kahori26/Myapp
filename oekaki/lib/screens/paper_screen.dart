import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oekaki/components/selectwidth.dart';
import 'package:provider/provider.dart';
import 'package:oekaki/components/palette.dart';
import 'package:oekaki/components/paper.dart';
import 'package:oekaki/models/strokes_model.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);

    return Scaffold(
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
          //Text("a"),
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
