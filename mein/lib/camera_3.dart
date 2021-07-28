import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mein/bottomnavigationbar.dart';
import 'dart:async';

import 'api.dart';

//Edge detection
//import 'package:edge_detection/edge_detection.dart';

import 'package:http/http.dart' as http;

class Camera_3 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//사진 찍기

class _MyHomePageState extends State<Camera_3> {
  String _imagePath;
  File _image;
  PickedFile _image_2;
  //final picker = ImagePicker();
  //
  Uint8List _imageBytes;
  String _imageName;
  final picker = ImagePicker();
  CloudApi api;
  bool isUploaded = false;
  bool loading = false;

  final String _url = "https://mein-flask.run.goorm.io/result";

  Widget LoadingImage(Uint8List imageData) {
    return Image.memory(imageData);
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/credentials.json').then((json) {
      api = CloudApi(json);
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    //Edge detection
    // String imagePath = await EdgeDetection.detectEdge;

    // try {
    //   imagePath = (await EdgeDetection.detectEdge);
    //   print("$imagePath");
    // } on PlatformException {
    //   imagePath = 'Failed to get cropped image path.';
    // }
    // if (!mounted) return;

    // setState(() {
    //   _imagePath = imagePath;
    // });

    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
        //return imageData;
        //
        _imageBytes = _image.readAsBytesSync();
        _imageName = _image.path.split('/').last;
        isUploaded = false;
      } else {
        print('No image selected.');
      }
    });
  }

/*
  Future getGallery() async {
    final PickedFile image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image_2 = image;
    });
  }
  */
  Future getGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        _image = File(pickedFile.path);
        //
        _imageBytes = _image.readAsBytesSync();
        _imageName = _image.path.split('/').last;
        isUploaded = false;
      } else {
        //print('No image selected.');
        print('Take a Picture or Select a Photo');
      }
    });
  }

  void _saveImage() async {
    setState(() {
      loading = true;
    });
    // Upload to Google cloud
    final response = await api.save(_imageName, _imageBytes);
    print(response.downloadLink);
    setState(() {
      loading = false;
      isUploaded = true;
    });
    http.Response _res = await http.post("$_url",
        headers: {"Content-Type": "application/json"},
        body: {"imagename": _imageName});
    print(_res.body);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    /*
        children: <Widget>[
          Container(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image)),
          Container(
            child: _image_2 == null
                ? Text('No image')
                : Image.file(File(_image_2.path)))
      ]
      */
    //child: _image == null
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //   Center(
            //     child: ElevatedButton(
            //       onPressed: getImage,
            //       child: Text('Scan'),
            //     ),
            //   ),
            //   SizedBox(height: 20),
            //   Text('Cropped image path:'),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
            //     child: Text(
            //       '$_imagePath\n',
            //       style: TextStyle(fontSize: 10),
            //     ),
            //   ),
            _imageBytes == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          'Take a Picture',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                      ])
                //: Image.file(_image),
                : Stack(
                    children: [
                      Image.memory(_imageBytes),
                      if (loading)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      isUploaded
                          ? Center(
                              child: IconButton(
                                //radius: 40,
                                color: Colors.green,
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                onPressed: () => {
                                  Navigator.pushNamed(context, '/kakaoocr',
                                      arguments: _imageBytes)
                                },
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: FlatButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: _saveImage,
                                child: Text('Translate'),
                              ),
                            )
                    ],
                  )
          ]),

      //child: _image_2 == null ? Text('No image'): Image.file(File(_image_2.path)),
      //_image == null ? Text('No image selected.') : Image.file(_image),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: getImage,
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "btn2",
              onPressed: getGallery,
              child: Icon(Icons.add_photo_alternate),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}
