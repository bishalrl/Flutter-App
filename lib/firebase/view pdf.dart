import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class loadpdf extends StatefulWidget {
  const loadpdf({Key? key}) : super(key: key);

  @override
  State<loadpdf> createState() => _loadpdfState();
}

class _loadpdfState extends State<loadpdf> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> listExample() async {
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('files')
        .listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((firebase_storage.Reference ref) {
      print('Found directory: $ref');
    });
    Future<void> downloadURLExample() async {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('files/microprocessor.pdf')
          .getDownloadURL();
      print(downloadURL);
      PDFDocument doc = await PDFDocument.fromURL(downloadURL);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Viewpdf(doc))); //Notice the Push Route once this is done.
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      listExample();
      downloadURLExample();
      print("All done!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class Viewpdf extends StatelessWidget {
  PDFDocument document;
  Viewpdf(this.document);
  @override
  Widget build(BuildContext context) {
    return PDFViewer(document: document);
  }
}
