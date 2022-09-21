import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_flutter/pdf_viewer_flutter.dart';

class Ele extends StatefulWidget {
  @override
  _EleState createState() => new _EleState();
}

class _EleState extends State<Ele> {
  String _pefFilePath = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((file) {
      setState(() {
        _pefFilePath = file.path;
        print(_pefFilePath);
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2Fexception-handling019-355.pdf?alt=media&token=c58897c7-658c-476e-b151-bb6f98818f7d';
    ;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer for electronic')),
      body: Center(
        child: ElevatedButton(
          child: Text("exception handling"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PDFViewerScreen(_pefFilePath)),
          ),
        ),
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String? pefFilePath;
  PDFViewerScreen(this.pefFilePath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("PDF Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pefFilePath);
  }
}
