import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/palette_model.dart';

class PaletteListPage extends StatefulWidget {
  @override
  _PaletteListPage createState() => _PaletteListPage();
}

class _PaletteListPage extends State<PaletteListPage> {
  @override
  Widget build(BuildContext context) {
    //PaletteModel palette = context.watch()<PaletteModel>();
    var palette = Provider.of<PaletteModel>(context);

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
                TextSpan(text: '  パレット '),
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Icon(Icons.palette_outlined),
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
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: palette.palette.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: Container(
                  color: palette.palette[index] != null
                      ? palette.palette[index]
                      : Container(),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('このいろをすてる？'),
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
                              palette.remove(index);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
