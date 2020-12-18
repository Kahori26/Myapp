import 'package:flutter/widgets.dart';

class SavePaintModel extends ChangeNotifier {
  //static List<Image> _image = [];
  //List<Image> get images => _image;

  //var time = DateTime.now();
  //UnmodifiableListView<Image> get images => UnmodifiableListView(_image);
  //List<Item> get imageData => _image.map((id) => ValueKey(toString(time));

  static List<Item> _image = [];
  List<Item> get images => _image;

  void add(Image imagedata, DateTime time, String name) {
    //_image.add(PaintList(image)..add(image));
    //_image.add(imagedata.image);
    _image.add(Item(imagedata, time, name));
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

//@immutable
class Item {
  Image image;
  DateTime time;
  String name;

  Item(this.image, this.time, this.name);
}
