import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class PDFApi {
  static var filename;

  static Future<File> loadNetwork(String url) async {
    final Response = await http.get(Uri.parse(url));
    final bytes = Response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, Uint8List bytes) async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    return file;
  }
}
