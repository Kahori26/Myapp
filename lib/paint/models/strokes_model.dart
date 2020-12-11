import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:seni/paint/models/pen_model.dart';
//import 'package:oekaki/models/pen_width.dart';

class StrokesModel extends ChangeNotifier {
  //static List<Stroke> _strokes = [];
  List<Stroke> _strokes = [];
  List<Stroke> _undoneList = [];
  get all => _strokes;

  void add(PenModel pen, Offset offset) {
    //void add(PenModel pen, double x, double y) {
    _strokes.add(Stroke(pen.color, pen.width)..add(offset));
    notifyListeners();
  }

  void update(Offset offset) {
    //void update(double x, double y) {
    _strokes.last.add(offset);
    // _strokes.last.add(x, y);
    notifyListeners();
  }

  /*
   * undo可能か
   */
  bool canUndo() => _strokes.length > 0;
  /*
   * redo可能か
   */
  bool canRedo() => _undoneList.length > 0;

  void undo() {
    if (canUndo()) {
      _undoneList.add(_strokes.removeLast());
      notifyListeners();
    }
  }

  void redo() {
    if (canRedo()) {
      _strokes.add(_undoneList.removeLast());
      notifyListeners();
    }
  }

  void clear() {
    _strokes = [];
    notifyListeners();
  }
}

class Stroke {
  final List<Offset> points = [];
  final Color color;
  final double width;

  Stroke(this.color, this.width);
  //Stroke(this.color);
  //Stroke(this.width);

  add(Offset offset) {
    //add(double x, double y) {
    //offset.dy = offset.dy - 50;

    //offset.translate(0, -1000);
    points.add(offset.translate(0, -90));
  }
}
