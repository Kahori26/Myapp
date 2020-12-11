import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:seni/paint/models/pen_model.dart';
import 'package:seni/paint/components/palette.dart';

class PaletteModel extends ChangeNotifier {
  List<Color> _palette = [];
  List<Color> get palette => _palette;

  set add(Color color) {
    _palette.add(color);
    notifyListeners();
  }
}
