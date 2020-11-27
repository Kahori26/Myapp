import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:myapp/color.dart';

// void main() {
//   runApp(MyApp());
// }

class PhotoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hatch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/getphoto':(context) => GetImagePage(),
        // '/awesomePage': (context) => Findcolorpage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final picker = ImagePicker();

//カメラの写真を格納する準備
  // Future getImageFromCamera() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = File(pickedFile.path);
  //   });
  // }

//カメラロールの写真を選ぶ・格納
  // Future getImageFromGallery() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = File(pickedFile.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 300,
                  child: _image == null ? Text('写真を選んでね') : Image.file(_image)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // RaisedButton(
                //   onPressed: () => {Navigator.pushNamed(context, '/awesomePage')},
                //   ),
                FloatingActionButton(
                  // onPressed: GetImagePage(),
                  onPressed: () => {Navigator.pushNamed(context, '/getphoto')},
                  tooltip: 'Pick Image From Gallery',
                  child: Icon(Icons.photo_library),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//class getImagePage extends State<_HomePage> {
class GetImagePage extends StatefulWidget {
  @override
  _GetImagePageState createState() => _GetImagePageState();
}

class _GetImagePageState extends State<GetImagePage> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: FutureBuilder(
          future: getImageFromGallery(),
        )
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
