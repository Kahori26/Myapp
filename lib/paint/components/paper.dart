import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:seni/paint/models/pen_model.dart';
import 'package:seni/paint/models/strokes_model.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    final strokes = Provider.of<StrokesModel>(context);

    return Listener(
      onPointerDown: (details) {
        strokes.add(pen, details.position);
        //strokes.add(pen, details.position.dx, details.position.dy);
      },
      onPointerMove: (details) {
        strokes.update(details.position);
        //strokes.update(details.position.dx, details.position.dy);
      },
      onPointerUp: (details) {
        strokes.update(details.position);
        //strokes.update(details.position.dx, details.position.dy);
      },
      child: Stack(
        children: <Widget>[
          //Image.asset('images/sample.jpg', fit: BoxFit.contain),

          CustomPaint(
            painter: _Painter(strokes),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
            ),
          ),
          /*Align(
            alignment: Alignment.center,
            child: Image.asset("images/ChristmasBear.png", fit: BoxFit.contain),
          ),*/
        ],
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final StrokesModel strokes;

  _Painter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    strokes.all.forEach((stroke) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeCap = StrokeCap.round
        //..strokeWidth = 5;
        ..strokeWidth = stroke.width;
      canvas.drawPoints(PointMode.polygon, stroke.points, paint);
    });
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}
