import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';

const apikey =
    "d776abc7605f400d96a837b5bb910460ec6c8233bd08c8c36768ef168111ce19013bbe0a9ef81104";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CameraDeepAr(
                onCameraReady: (isReady) {
                  setState(() {});
                },
                onImageCaptured: (path) {
                  setState(() {});
                },
                onVideoRecorded: (path) {
                  setState(() {});
                },
                androidLicenceKey: apikey,
                iosLicenceKey: apikey,
                cameraDeepArCallback: (c) async {
                  cameraDeepArController = c;
                  setState(() {});
                }),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: FloatingActionButton(
                        backgroundColor: Colors.amber,
                        child: Icon(Icons.navigate_next),
                        onPressed: () => {
                              cameraDeepArController.changeMask(effectCount),
                              if (effectCount == 7) {effectCount = 0},
                              effectCount++
                            })))
          ],
        ),
      ),
    );
  }
}
