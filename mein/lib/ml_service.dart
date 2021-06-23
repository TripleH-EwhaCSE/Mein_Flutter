import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MLService {
  Dio dio = Dio();
// ml server
// https://github.com/PuzzleLeaf/tensorflow_flask_api_server
  Future<Uint8List> convertImage(Uint8List imageData) async {
    try {
      var encodedData = await compute(base64Encode, imageData);
      Response response = await dio.post(
          'https://kakaoocrresult.herokuapp.com/ocrresult',
          data: {'image': encodedData});
      String result = response.data;
      return compute(base64Decode, result);
    } catch (e) {
      return null;
    }
  }
}
