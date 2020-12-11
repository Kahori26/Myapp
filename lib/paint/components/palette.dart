import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:seni/paint/models/pen_model.dart';
import 'package:seni/paint/models/palette_model.dart';

class Palette extends StatelessWidget {
/*  
  static const colors = [
    //  static List<int> colors = [
    Colors.white,
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];
*/
  static const colors = [
    Color(0x55ffffff),
    Color(0x55ff00a5),
    Color(0x55ff0000),
    Color(0x55ffa500),
    Color(0x55ffff00),
    Color(0x5500ff00),
    Color(0x5500ffff),
    Color(0x550000ff),
    Color(0x55ff00ff),
    Color(0x558f6552),
    Color(0x55cccccc),
    Color(0x55000000),
  ];

  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    final palette = Provider.of<PaletteModel>(context);
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: colors.length,
        itemCount: palette.palette.length,
        itemBuilder: (context, index) {
          //final c = colors[index];
          final c = palette.palette[index];
          return GestureDetector(
            onTap: () {
              pen.color = c;
            },
            child: color(c, c == pen.color),
          );
        },
      ),
    );
  }

  Widget color(Color color, bool selected) {
    return Container(
      height: 50,
      width: 45,
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              width: selected ? 3 : 1,
            ),
          ),
        ),
      ),
    );
  }
}
