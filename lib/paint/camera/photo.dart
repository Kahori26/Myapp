import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seni/paint/camera/color.dart';

class PhotoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hatch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/',
      // routes: {
      // '/': (context) => HomePage(),
      // '/findcolor': (BuildContext context) => Findcolorpage(),
      // '/findcolor': (BuildContext context) => new Findcolorpage(),
      // },
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   File _image;
//   final picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Image Picker Demo'),
//         ),
//           body: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                       width: 300,
//                       child: _image == null
//                           ? Text('写真を選んでね')
//                           : Image.file(_image)),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     FloatingActionButton(
//                       onPressed: () =>
//                           {Navigator.pushNamed(context, '/getphoto')},
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//   }
// }

class GetImagePage extends StatefulWidget {
  @override
  _GetImagePageState createState() => _GetImagePageState();
}

class _GetImagePageState extends State<GetImagePage> {
  File _image;
  final picker = ImagePicker();

  void initState() {
    super.initState();
    getImageFromGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD:lib/paint/camera/photo.dart
        body: Center(
          child: Container(
              //_image がnullのときの処理
              child: _image == null
                  ? CircularProgressIndicator()
                  : Image.file(_image)),
=======
        body: MaterialApp(
          home: Center(
            child: Container(
                //_image がnullのときの処理
                child: _image == null
                    ? CircularProgressIndicator()
                    : Image.file(_image)),
          ),
          initialRoute: '/',
          routes: {
            '/color': (context) => Findcolorpage(),
            // '/color': (context) => GetColorPage(),
          },
>>>>>>> origin/master:lib/photo.dart
        ),
        //initialRoute: '/',

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.color_lens_rounded),
          onPressed: () {
            print(_image);
            Navigator.of(context).pushNamed('/color', arguments: _image);
            //Navigator.of(context).pushNamed("/color");
          },
        ));
  }

// 写真を選ぶfuture
  Future getImageFromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedImage.path);
    });
  }
}
