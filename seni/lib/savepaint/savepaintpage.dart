import 'package:flutter/material.dart';
//import 'package:seni/paint/models/strokes_model.dart';
//import 'package:seni/paint/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'package:seni/savepaint/capture.dart';
import 'package:seni/paint/screens/paper_screen.dart';

//import '../models/pen_model.dart';

class SavePaintPage extends StatefulWidget {
  //final Image image;
  //SavePaintPage({this.image});
  @override
  //_SavePaintPageState createState({Image image}) =>
  //    _SavePaintPageState(image: image);

  _SavePaintPageState createState() => _SavePaintPageState();
}

class _SavePaintPageState extends State<SavePaintPage> {
  static List<Image> SavePaintList = [];
  int index;
  //final Image image;
  //_SavePaintPageState({@required this.image});
  //_SavePaintPageState();
  @override
  Widget build(BuildContext context) {
    //image = ModalRoute.of(context).settings.arguments;
    //SavePaintList[index]=ModalRoute.of(context).settings.arguments;

    SavePaintList.add(ModalRoute.of(context).settings.arguments);
    //SavePaintList.add(image);
    //print(image);
    print('length:');
    print(SavePaintList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      /*body: Container(
        Center(
          child: _image != null ? _image : Container(),
        ),
      ),*/
      /*body: ListView.builder(
        itemCount: SavePaintList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              /*
               * キャプチャ表示エリア
               */
              /*Container(
            color: Colors.yellow,
            height: 200.0,
            child: Center(
              child: image != null ? image : Container(),
            ),
          ),*/
              leading: image,
              //title: Text(SavePaintList[index]),
              //Image.memory(SavePaintList[index]),
            ),
          );
        },
      ),*/
      /*
               * キャプチャ表示エリア
               */
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          for (index = 0; index < SavePaintList.length; index++)
            Container(
              //color: Colors.yellow,
              height: 200,
              alignment: Alignment.topLeft,
              //child: image != null ? image : Container(),
              child: SavePaintList[index] != null
                  ? SavePaintList[index]
                  : Container(),
              //child: SavePaintList[index]
            ),
        ],
      ),
    );
  }
}
