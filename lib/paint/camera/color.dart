// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:io';
import 'dart:async';
import 'dart:math' as math;
// import 'dart:convert';
import 'dart:typed_data';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../main.dart';
import 'package:seni/paint/models/palette_model.dart';

const Color _kBackgroundColor = Color(0xFFFFF8E1);
const Color _kSelectionRectangleBackground = Color(14481663);
const Color _kSelectionRectangleBorder = Color(0x80000000);
const Color _kPlaceholderColor = Color(0x80404040);
int savecount = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/top': (BuildContext context) => new TopPage(),
      },
    );
  }
}

/// The main Application class.
class Findcolorpage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final File image = ModalRoute.of(context).settings.arguments;
    // Uint8List bytes = image.readAsBytesSync() as Uint8List;

    // print(bytes);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 4.0,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Pacifico",
            ),
            children: [
              TextSpan(text: '  いろあつめ '),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(Icons.photo_camera_outlined),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed("/Main"),
          )
        ],
      ),
      body: MaterialApp(
        //home: ImageColors(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => PaletteModel(),
          // home: Image.memory(bytes),
          // image: MemoryImage(bytes),
          child: ImageColors(
            image: FileImage(image),
            // image: AssetImage("assets/d.jpg"),
            imageSize: Size(256.0, 250.0),
          ),
        ),
      ),
    );
  }
}

/// The home page for this example app.
@immutable
class ImageColors extends StatefulWidget {
  /// Creates the home page.
  const ImageColors({Key key, this.image, this.imageSize, r}) : super(key: key);

  /// The title that is shown at the top of the page.
  // final String title;

  /// This is the image provider that is used to load the colors from.
  final ImageProvider image;

  /// The dimensions of the image.
  final Size imageSize;

  @override
  _ImageColorsState createState() {
    return _ImageColorsState();
  }
}

class _ImageColorsState extends State<ImageColors> {
  Rect region;
  Rect dragRegion;
  Offset startDrag;
  Offset currentDrag;
  PaletteGenerator paletteGenerator;

  final GlobalKey imageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    region = Offset.zero & widget.imageSize;
    _updatePaletteGenerator(region);
  }

  Future<void> _updatePaletteGenerator(Rect newRegion) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      widget.image,
      size: widget.imageSize,
      region: newRegion,
      maximumColorCount: 20,
    );
    setState(() {});
  }

  // Called when the user starts to drag
  void _onPanDown(DragDownDetails details) {
    final RenderBox box = imageKey.currentContext.findRenderObject();
    final Offset localPosition = box.globalToLocal(details.globalPosition);
    setState(() {
      startDrag = localPosition;
      currentDrag = startDrag;
      dragRegion = Rect.fromPoints(startDrag, currentDrag);
    });
  }

  // Called as the user drags: just updates the region, not the colors.
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      currentDrag += details.delta;
      dragRegion = Rect.fromPoints(startDrag, currentDrag);
    });
  }

  // Called if the drag is canceled (e.g. by rotating the device or switching
  // apps)
  void _onPanCancel() {
    setState(() {
      dragRegion = null;
      startDrag = null;
    });
  }

  // Called when the drag ends. Sets the region, and updates the colors.
  Future<void> _onPanEnd(DragEndDetails details) async {
    Rect newRegion =
        (Offset.zero & imageKey.currentContext.size).intersect(dragRegion);
    if (newRegion.size.width < 4 && newRegion.size.width < 4) {
      newRegion = Offset.zero & imageKey.currentContext.size;
    }
    await _updatePaletteGenerator(newRegion);
    setState(() {
      region = newRegion;
      dragRegion = null;
      startDrag = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBackgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            // GestureDetector is used to handle the selection rectangle.
            child: GestureDetector(
              onPanDown: _onPanDown,
              onPanUpdate: _onPanUpdate,
              onPanCancel: _onPanCancel,
              onPanEnd: _onPanEnd,
              child: Stack(children: <Widget>[
                Image(
                  key: imageKey,
                  image: widget.image,
                  width: widget.imageSize.width,
                  height: widget.imageSize.height,
                ),
                // This is the selection rectangle.
                Positioned.fromRect(
                    rect: dragRegion ?? region ?? Rect.zero,
                    child: Container(
                      decoration: BoxDecoration(
                          color: _kSelectionRectangleBackground,
                          border: Border.all(
                            width: 1.0,
                            // color: _kSelectionRectangleBorder,
                            style: BorderStyle.solid,
                          )),
                    )),
              ]),
            ),
          ),
          // Use a FutureBuilder so that the palettes will be displayed when
          // the palette generator is done generating its data.
          PaletteSwatches(generator: paletteGenerator),
        ],
      ),
    );
  }
}

/// A widget that draws the swatches for the [PaletteGenerator] it is given,
/// and shows the selected target colors.
class PaletteSwatches extends StatelessWidget {
  /// Create a Palette swatch.
  ///
  /// The [generator] is optional. If it is null, then the display will
  /// just be an empty container.
  const PaletteSwatches({Key key, this.generator}) : super(key: key);

  /// The [PaletteGenerator] that contains all of the swatches that we're going
  /// to display.
  final PaletteGenerator generator;

  @override
  Widget build(BuildContext context) {
    final List<Widget> swatches = <Widget>[];
    if (generator == null || generator.colors.isEmpty) {
      return Container();
    }
    // for (Color color in generator.colors) {
    //   swatches.add(PaletteSwatch(color: color));
    // }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: swatches,
        ),
        Container(height: 30.0),
        PaletteSwatch(label: 'メインカラー', color: generator.dominantColor?.color),
        PaletteSwatch(
            label: 'あかるいいろ', color: generator.lightVibrantColor?.color),
        PaletteSwatch(label: 'あざやかないろ', color: generator.vibrantColor?.color),
        // PaletteSwatch(
        //     label: 'GET!!!', color: generator.darkVibrantColor?.color),
        // PaletteSwatch(
        //     label: 'Light Muted', color: generator.lightMutedColor?.color),
      ],
    );
  }
}

/// A small square of color with an optional label.
@immutable
class PaletteSwatch extends StatelessWidget {
  /// Creates a PaletteSwatch.
  ///
  /// If the [color] argument is omitted, then the swatch will show a
  /// placeholder instead, to indicate that there is no color.
  const PaletteSwatch({
    Key key,
    this.color,
    this.label,
  }) : super(key: key);

  /// The color of the swatch. May be null.
  final Color color;

  /// The optional label to display next to the swatch.
  final String label;

  @override
  Widget build(BuildContext context) {
    // Compute the "distance" of the color swatch and the background color
    // so that we can put a border around those color swatches that are too
    // close to the background's saturation and lightness. We ignore hue for
    // the comparison.
    final HSLColor hslColor = HSLColor.fromColor(color ?? Colors.transparent);
    final HSLColor backgroundAsHsl = HSLColor.fromColor(_kBackgroundColor);
    final double colorDistance = math.sqrt(
        math.pow(hslColor.saturation - backgroundAsHsl.saturation, 2.0) +
            math.pow(hslColor.lightness - backgroundAsHsl.lightness, 2.0));
    final palette = Provider.of<PaletteModel>(context);
    savecount = 0;
    Widget swatch = Padding(
      padding: const EdgeInsets.all(5.0),
      child: color == null
          ? const Placeholder(
              fallbackWidth: 60.0,
              fallbackHeight: 30.0,
              color: Color(0xff404040),
              strokeWidth: 2.0,
            )
          : Container(
              child: SizedBox(
                  width: 60.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: color,
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _kPlaceholderColor,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        //barrierColor: color,
                        context: context,
                        builder: (context) {
                          return savecount < 2
                              ? AlertDialog(
                                  backgroundColor: color,
                                  title: Text('このいろをあつめる？'),
                                  content: Text(
                                      'あと' + '${2 - savecount}' + 'つあつめられるよ'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('いいえ'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text('はい'),
                                      onPressed: () {
                                        palette.palette
                                            .add(color.withAlpha(150));
                                        savecount++;

                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                              : AlertDialog(
                                  title: Text('もう保存できないよ'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                          /*return AlertDialog(
                            backgroundColor: color,
                            title: Text('この色を保存する？'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('キャンセル'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  palette.palette.add(color.withAlpha(150));

                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );*/
                        },
                      );

                      //print(palette.palette.last.toString());
                    },
                  )),
            ),
    );

    if (label != null) {
      swatch = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200.0, minWidth: 130.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            swatch,
            Container(width: 15.0),
            Text(label),
          ],
        ),
      );
    }
    return swatch;
  }
}
