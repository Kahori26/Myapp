import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:oekaki/models/pen_model.dart';

class SelectWidth extends StatelessWidget {
  static const width_list = [3.0, 5.0, 8.0];

  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: width_list.length,
        itemBuilder: (context, index) {
          final w = width_list[index];
          return GestureDetector(
            onTap: () {
              pen.width = w;
            },
            child: width(w, w == pen.width),
          );
        },
      ),
    );
  }

  Widget width(double width, bool selected) {
    return Container(
      height: 50,
      width: 45,
      child: Center(
        child: Container(
          height: width,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            /*border: Border.all(
              width: selected ? 3 : 1,
            ),*/
          ),
        ),
      ),
    );
  }
}
