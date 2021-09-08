import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CanvasPainting extends StatefulWidget {
  final File imageFile;

  CanvasPainting({this.imageFile});
  @override
  _CanvasPaintingState createState() =>
      _CanvasPaintingState(imageFile: this.imageFile);
}

class _CanvasPaintingState extends State<CanvasPainting> {
  GlobalKey globalKey = GlobalKey();
  File imageFile;
  List<TouchPoints> points = [];
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 3.0;
  Color selectedColor = Colors.black;

  _CanvasPaintingState({this.imageFile});

  Future<void> _pickStroke() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick stroke value.
            actions: <Widget>[
              //Resetting to default stroke value
              CupertinoButton(
                child: Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  strokeWidth = 3.0;
                  Navigator.of(context).pop();
                },
              ),
              CupertinoButton(
                child: Icon(
                  Icons.brush,
                  size: 24,
                ),
                onPressed: () {
                  strokeWidth = 10.0;
                  Navigator.of(context).pop();
                },
              ),
              CupertinoButton(
                child: Icon(
                  Icons.brush,
                  size: 40,
                ),
                onPressed: () {
                  strokeWidth = 30.0;
                  Navigator.of(context).pop();
                },
              ),
              CupertinoButton(
                child: Icon(
                  Icons.brush,
                  size: 60,
                ),
                onPressed: () {
                  strokeWidth = 50.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _opacity() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true,

      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick opacity value.
            actions: <Widget>[
              CupertinoButton(
                child: Icon(
                  Icons.opacity,
                  size: 24,
                ),
                onPressed: () {
                  //most transparent
                  opacity = 0.1;
                  Navigator.of(context).pop();
                },
              ),
              CupertinoButton(
                child: Icon(
                  Icons.opacity,
                  size: 40,
                ),
                onPressed: () {
                  opacity = 0.5;
                  Navigator.of(context).pop();
                },
              ),
              CupertinoButton(
                child: Icon(
                  Icons.opacity,
                  size: 60,
                ),
                onPressed: () {
                  //not transparent at all.
                  opacity = 1.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _save() async {
    // RenderRepaintBoundary boundary =
    //     globalKey.currentContext.findRenderObject();
    // ui.Image image = await boundary.toImage();
    // ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // Uint8List pngBytes = byteData.buffer.asUint8List();

    // //Request permissions if not already granted
    // if (!(await Permission.storage.status.isGranted))
    //   await Permission.storage.request();

    // final result = await ImageGallerySaver.saveImage(
    //     Uint8List.fromList(pngBytes),
    //     quality: 60,
    //     name: "canvas_image");
    // print(result);
  }

  List<Widget> fabOption() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "paint_save",
        child: Icon(Icons.save),
        tooltip: 'Save',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            _save();
          });
        },
      ),
      FloatingActionButton(
        heroTag: "paint_stroke",
        child: Icon(Icons.brush),
        tooltip: 'Stroke',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            _pickStroke();
          });
        },
      ),
      FloatingActionButton(
        heroTag: "paint_opacity",
        child: Icon(Icons.opacity),
        tooltip: 'Opacity',
        onPressed: () {
          //min:0, max:1
          setState(() {
            _opacity();
          });
        },
      ),
      FloatingActionButton(
          heroTag: "erase",
          child: Icon(Icons.clear),
          tooltip: "Erase",
          onPressed: () {
            setState(() {
              points.clear();
            });
          }),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_red",
        child: colorMenuItem(Colors.red),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.red;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_green",
        child: colorMenuItem(Colors.green),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.green;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_pink",
        child: colorMenuItem(Colors.pink),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.pink;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_blue",
        child: colorMenuItem(Colors.blue),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.blue;
          });
        },
      ),
    ];
  }

  bool optionOpened = false;
  bool appOptions = false;
  double optionHeight() {
    if (optionOpened && MediaQuery.of(context).viewInsets.bottom == 0.0) {
      return 84.0;
    } else {
      return 0;
    }
  }

  void convertWidgetToImage() async {
    RenderRepaintBoundary repaintBoundary =
        globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    // Navigator.of(globalKey.currentContext).push(
    //   MaterialPageRoute(
    //     builder: (context) => SecondScreen(
    //       imageData: uint8list,
    //     ),
    //   ),
    // );
  }

  final picker = ImagePicker();

  Widget bottomSheet() {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            var image = await picker.getImage(source: ImageSource.gallery);
            setState(() {
              imageFile = File(image.path);
            });
            Navigator.pop(context);
          },
          child: Text(
            'Choose From Gallery',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            var image = await picker.getImage(source: ImageSource.camera);

            setState(() {
              imageFile = File(image.path);
            });
            Navigator.pop(context);
          },
          child: Text(
            'Open Camera',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancel',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: CupertinoColors.inactiveGray,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _save();
                });
              },
              icon: Icon(CupertinoIcons.arrow_down,
                  color: Theme.of(context).primaryIconTheme.color),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _pickStroke();
                });
              },
              icon: Icon(CupertinoIcons.paintbrush,
                  color: Theme.of(context).primaryIconTheme.color),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _opacity();
                });
              },
              icon: Icon(CupertinoIcons.circle_bottomthird_split,
                  color: Theme.of(context).primaryIconTheme.color),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  points.clear();
                });
              },
              icon: Icon(CupertinoIcons.arrow_counterclockwise_circle,
                  color: Theme.of(context).primaryIconTheme.color),
            ),
            IconButton(
                icon: Icon(
                  appOptions
                      ? CupertinoIcons.hexagon_fill
                      : CupertinoIcons.hexagon,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                onPressed: () {
                  setState(() {
                    appOptions = !appOptions;
                  });
                }),
            IconButton(
              icon: Icon(Icons.camera, color: CupertinoColors.white),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => bottomSheet(),
                );
              },
            ),
            IconButton(
              onPressed: () => convertWidgetToImage,
              icon: Icon(CupertinoIcons.checkmark_alt,
                  color: Theme.of(context).primaryIconTheme.color),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  RenderBox renderBox = context.findRenderObject();
                  points.add(TouchPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeType
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                });
              },
              onPanStart: (details) {
                setState(() {
                  RenderBox renderBox = context.findRenderObject();
                  points.add(TouchPoints(
                      points: renderBox.globalToLocal(details.globalPosition),
                      paint: Paint()
                        ..strokeCap = strokeType
                        ..isAntiAlias = true
                        ..color = selectedColor.withOpacity(opacity)
                        ..strokeWidth = strokeWidth));
                });
              },
              onPanEnd: (details) {
                setState(() {
                  points.add(null);
                });
              },
              child: RepaintBoundary(
                key: globalKey,
                child: Stack(
                  children: <Widget>[
                    imageFile != null
                        ? Center(
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Center(
                            child: new Text('No image selected.'),
                          ),
                    CustomPaint(
                      size: Size.infinite,
                      painter: MyPainter(
                        pointsList: points,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 720,
              child: Container(
                constraints: BoxConstraints.tightForFinite(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10),
                child: AnimatedOpacity(
                  opacity: appOptions ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_red",
                          child: colorMenuItem(Colors.red),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.red;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_green",
                          child: colorMenuItem(Colors.green),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.green;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_pink",
                          child: colorMenuItem(Colors.pink),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.pink;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_blue",
                          child: colorMenuItem(Colors.blue),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.blue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_yellow",
                          child: colorMenuItem(Colors.yellow),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.yellow;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_deepOrange",
                          child: colorMenuItem(Colors.deepOrange),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.deepOrange;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_deepPurple",
                          child: colorMenuItem(Colors.deepPurple),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.deepPurple;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_lightBlue",
                          child: colorMenuItem(Colors.lightBlue),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.lightBlue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          heroTag: "color_lightBlueAccent",
                          child: colorMenuItem(Colors.lightBlueAccent),
                          tooltip: 'Color',
                          onPressed: () {
                            setState(() {
                              selectedColor = Colors.lightBlueAccent;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // floatingActionButton: AnimatedFloatingActionButton(
        //   fabButtons: fabOption(),
        //   colorStartAnimation: Colors.blue,
        //   colorEndAnimation: Colors.cyan,
        //   animatedIconData: AnimatedIcons.menu_close,
        // ),
      ),
    );
  }

  Widget colorMenuItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          height: 45,
          width: 45,
          color: color,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({this.pointsList});

  //Keep track of the points tapped on the screen
  List<TouchPoints> pointsList;
  List<Offset> offsetPoints = [];

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));

        //Draw points when two points are not next to each other
        canvas.drawPoints(
            ui.PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

//Class to define a point touched at canvas
class TouchPoints {
  Paint paint;
  Offset points;
  TouchPoints({this.points, this.paint});
}
