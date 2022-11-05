import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class Fun3 extends StatefulWidget {
  @override
  _Fun3State createState() => _Fun3State();
}

class _Fun3State extends State<Fun3> {
  final sampleUrl =
      'https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2Fexception-handling019-355.pdf?alt=media&token=c58897c7-658c-476e-b151-bb6f98818f7d';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('pdf'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("pdfs"),
                  onPressed: loadPdf,
                ),
                if (pdfFlePath != null)
                  Expanded(
                    child: Container(
                      child: PdfView(path: pdfFlePath!),
                    ),
                  )
                else
                  Text("Pdf is not Loaded"),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class Fun3 extends StatefulWidget {
//   @override
//   _Fun3State createState() => _Fun3State();
// }

// class _Fun3State extends State<Fun3> {
//   Switch(
//     case1(
//   final sampleUrl =
//       "https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2Fmicroprocessor.pdf?alt=media&token=50e8f968-0f19-4241-8564-7df67858bbac";
//   ),
//   ),
//   String? pdfFlePath;

//   Future<String> downloadAndSavePdf() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/sample.pdf');
//     if (await file.exists()) {
//       return file.path;
//     }
//     final response = await http.get(Uri.parse(sampleUrl));
//     await file.writeAsBytes(response.bodyBytes);
//     return file.path;
//   }

//   void loadPdf() async {
//     pdfFlePath = await downloadAndSavePdf();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(builder: (context) {
//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: Text('pdf'),
//           ),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 ElevatedButton(
//                   child: Text("pdfs"),
//                   onPressed: loadPdf,
//                 ),
//                 if (pdfFlePath != null)
//                   Expanded(
//                     child: Container(
//                       child: PdfView(path: pdfFlePath!),
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
