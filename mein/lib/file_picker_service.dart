import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<Uint8List> imageFilePickAsBytes(File file) async {
    // FilePickerResult result = await FilePicker.platform
    //     .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);

    if (file != null) {
      // File file = File(result.files.single.path);
      return file.readAsBytes();
    } else {
      return null;
    }
  }
}
