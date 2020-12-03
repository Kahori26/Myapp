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
    _strokes.add(Stroke(pen.color, pen.width)..add(offset));
    notifyListeners();
  }

  void update(Offset offset) {
    _strokes.last.add(offset);
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
    points.add(offset);
  }
}
