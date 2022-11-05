// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   String urlPDFPath = "";

//   @override
//   void initState() {
//     super.initState();
//     getFileFromUrl(
//             "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf")
//         .then((f) {
//       setState(() {
//         urlPDFPath = f.path;
//         print("done on url");
//       });
//     });
//   }

//   getFileFromUrl(String url) async {
//     try {
//       var data = await http.get(Uri.parse(urlPDFPath));
//       var bytes = data.bodyBytes;
//       var dir = await getApplicationDocumentsDirectory();
//       File file = File("${dir.path}/mypdf.pdf");
//       File url = await file.writeAsBytes(bytes);
//       return url;
//     } catch (e) {
//       throw Exception("error opening the pdf");
//     }
//   }

//   void loadPdf() async {
//     pdfload = await getFileFromUrl();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FlutterPluginPDFViewer'),
//       ),
//       body: Center(
//         child: Center(
//             child: Column(
//           children: [
//             MaterialButton(
//               onPressed: () {
//                 if (urlPDFPath != null) {}
//               },
//               child: Text("application"),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

// // class Pdfviewpage extends StatefulWidget {
// //   final String path;
// //   const Pdfviewpage({Key? key, required this.path}) : super(key: key);

// //   @override
// //   State<Pdfviewpage> createState() => _PdfviewpageState();
// // }

// // class _PdfviewpageState extends State<Pdfviewpage> {
// //   bool pdfReady = false;
// //   int _totalpages = 0;
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         home: Scaffold(
// //       body: Stack(children: <Widget>[
// //         //  PDFViewer(document: );
// //       ]),
// //     ));
// //   }
// // }
