import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:mein/bottomnavigationbar.dart';
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

  //https://mein-flask.run.goorm.io http://34.64.112.13/

  final String _url = "http://34.64.112.13/result";

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
    imageCache.maximumSize = 0;
    imageCache.clear();
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

    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({"imagename": _imageName});
    http.Response _res = await http.post("$_url", headers: headers, body: msg);

    print(_res.body);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
      body: _imageBytes == null
          ? Stack(children: [
              Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Center(
                      child: (Text(
                    'Going to take a picture of the menu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.lightBlueAccent,
                    ),
                    textAlign: TextAlign.center,
                  )))),
              Center(
                //top: screenHeight/2,
                //left: screenHeight/2,
                child: IconButton(
                  //color: Colors.blueAccent,
                  icon: Icon(Icons.camera_alt),
                  onPressed: getGallery,
                  color: Colors.lightBlueAccent,
                  //textColor: Colors.white,
                  //child: Text('Translate'),
                ),
              )
            ])
          //: Image.file(_image),
          : Stack(children: [
              Center(child: Image.memory(_imageBytes)),
              if (loading)
                Center(
                  child: CircularProgressIndicator(),
                ),
              isUploaded
                  ? Center(
                      child: IconButton(
                        //radius: 40,
                        //: Colors.green,
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () => {
                          Navigator.pushNamed(context, '/kakaoocr',
                              arguments: _imageBytes)
                        },
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        //color: Colors.blueAccent,
                        child: Icon(
                          Icons.wysiwyg,
                          size: 30,
                        ),
                        //textColor: Colors.white,
                        onPressed: _saveImage,
                        //child: Text('Translate'),
                      ),
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
      //bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}
