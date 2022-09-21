// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class Fun1 extends StatefulWidget {
//   @override
//   _Fun1State createState() => _Fun1State();
// }

// class _Fun1State extends State<Fun1> {
//   final sampleUrl1 =
//       'https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2FPROPOSAL.pdf?alt=media&token=b31089dd-3bc9-4ad2-9cb7-61ca3bd94a93';

//   String? pdfFlePath1;

//   Future<String> downloadAndSavePdf1() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/sample.pdf');
//     if (await file.exists()) {
//       return file.path;
//     }
//     final response = await http.get(Uri.parse(sampleUrl1));
//     await file.writeAsBytes(response.bodyBytes);
//     return file.path;
//   }

//   void loadPdf1() async {
//     pdfFlePath1 = await downloadAndSavePdf1();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(builder: (context) {
//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: Text('Plugin example app'),
//           ),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 ElevatedButton(
//                   child: Text("microprocessor"),
//                   onPressed: loadPdf1,
//                 ),
//                 if (pdfFlePath1 != null)
//                   Expanded(
//                     child: Container(
//                       child: PdfView(path: pdfFlePath1!),
//                     ),
//                   )
//                 else
//                   Text("Pdf is not Loaded"),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
