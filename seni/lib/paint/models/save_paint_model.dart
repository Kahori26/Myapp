import 'package:flutter/widgets.dart';

class SavePaintModel extends ChangeNotifier {
  static List<Image> _image = [];
  //var time = DateTime.now();
  //UnmodifiableListView<Image> get images => UnmodifiableListView(_image);
  List<Image> get images => _image;
  //List<Item> get imageData => _image.map((id) => ValueKey(toString(time));

  void add(Image imagedata) {
    //_image.add(PaintList(image)..add(image));
    //_image.add(imagedata.image);
    _image.add(imagedata);
    print("add data");
    notifyListeners();
  }

/*
  void update(Image image) {
    _image.last.add(image);
    notifyListeners();
  }
*/

  void clear() {
    _image = [];
    notifyListeners();
  }
}
