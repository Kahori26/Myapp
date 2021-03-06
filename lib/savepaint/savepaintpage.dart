import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:seni/paint/models/strokes_model.dart';
//import 'package:seni/paint/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'package:seni/savepaint/capture.dart';
import 'package:seni/paint/screens/paper_screen.dart';
import 'package:seni/paint/models/save_paint_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:seni/savepaint/selectimagepage.dart';

class SavePaintPage extends StatefulWidget {
  //final Image image;
  //SavePaintPage({this.image});
  @override
  //_SavePaintPageState createState({Image image}) =>
  //    _SavePaintPageState(image: image);

  _SavePaintPageState createState() => _SavePaintPageState();
}

//class SavePaintPage extends StatelessWidget {
class _SavePaintPageState extends State<SavePaintPage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
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
              TextSpan(text: '  ほぞんリスト '),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(Icons.photo_library),
                ),
              ),
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

      /*body: Container(
        //color: Colors.yellow,
        child: _PaintList(),
        
      ),*/
      body: Container(
        child: PaintList(),
      ),

      //savepaint.add(_image)
    );
  }
}

class PaintList extends StatefulWidget {
  @override
  _PaintList createState() => _PaintList();
}

//class _PaintList extends StatelessWidget {
class _PaintList extends State<PaintList> {
  @override
  Widget build(BuildContext context) {
    //var saveimage = context.watch<SavePaintModel>();
    var saveimage = Provider.of<SavePaintModel>(context);
    final Size size = MediaQuery.of(context).size;
    //var index;
    //var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    //var formatted = formatter.format(saveimage);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: saveimage.images.length,
      itemBuilder: (context, index) => Card(
        //itemBuilder: (context, index) => Wrap(
        //child: Wrap(
        //direction: Axis.horizontal,

        child: Column(
          children: <Widget>[
            //direction: Axis.horizontal,
            //Row(
            //children: <Widget>[
            ListTile(
              leading: Container(
                child: saveimage.images[index] != null
                    ? saveimage.images[index].image
                    : Container(),
              ),
              title: Text(
                DateFormat.yMMMd('ja').format(saveimage.images[index].time),
              ),
              subtitle: Text(saveimage.images[index].name),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('データをけす'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('やめる'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('はい'),
                            onPressed: () {
                              saveimage.remove(index);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              onTap: () => Navigator.of(context).pushNamed("/SelectImagePage",
                  arguments: saveimage.images[index]),
              //title: Text("日付"),
            ),
            /*Container(
              child: Text(saveimage.images[index].name),
            ),*/
            //Container(
            // child: Card(
            /*child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  DateFormat.yMMMd('ja').format(saveimage.images[index].time),
                ),
              ),
              Container(
                child: Text(saveimage.images[index].name),
              ),

              /*Container(
                height: size.height / 2,
                width: size.width / 2,
                child: saveimage.images[index] != null
                    ? saveimage.images[index].image
                    : Container(),
              ),*/
            ],
          ),
          //],
        ),*/
            //),
            //),
          ],
        ),
        //),

        //),
      ),
    );
  }
}
