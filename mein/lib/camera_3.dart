import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

/*
void permission() async {
  Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
  print('per1 : $permissions');
}

class Camera_3 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Picker Example',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.red,
      ),
      home: Camera_3_1(title: 'Media Picker Example App'),
    );
  }
}

class Camera_3_1 extends StatefulWidget {
  Camera_3_1({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Camera_3_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MediaGrid(),
    );
  }
}

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _fetchNewMedia() async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      print(albums);
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

*/
//void main() => runApp(MyApp());

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
*/

final _picker = ImagePicker();

// ignore: camel_case_types
class Camera_3 extends StatefulWidget {
  @override
  _Camera_3_State createState() => _Camera_3_State();
}

// ignore: camel_case_types
class _Camera_3_State extends State<Camera_3> {
  File _image;
  final picker = ImagePicker();

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, maxWidth: 60);

    setState(() {
      _image = File(imageFile.path);
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image'),
      ),
      body: Center(
        child: _image != null
            ? Image.file(
                _image,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text(
                'No image selected.',
                textAlign: TextAlign.center,
              ),
        //alignment: Alignment.center,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
