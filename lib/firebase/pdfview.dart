import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fun extends StatefulWidget {
  final String pdfUrl;
  const Fun({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {
  _loadPdf(String url) async {
    File file = File(' computer.notes[index].pdfUrl!');
    PDFDocument doc = await PDFDocument.fromFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class Fun extends StatefulWidget {
  
//   const Fun({Key? key}) : super(key: key);

//   @override
//   State<Fun> createState() => _FunState();
// }

// class _FunState extends State<Fun> {
//    final String pdfUrl="";
//   String pdfurl = "";
//   bool pdfReady = false;
//   void loadpdf() {
//     pdfurl = widget.pdfUrl;
//     setState(() {
//       Expanded(child: Center(child: Container(child: Text(pdfurl))));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("PDF Document"),



// class Fun extends StatefulWidget {
//   final String pdfUrl;
//   Fun({required this.pdfUrl});

//   @override
//   _FunState createState() => _FunState();
// }

// class _FunState extends State<Fun> {
//   String? pdfurl;

//   // void loadpdf()  {
//   //   pdfurl =  widget.pdfUrl;
//   //   setState(() {});
//   // }

//   Widget build(BuildContext context) {
//     return PDFViewerScaffold(
//         appBar: AppBar(
//           title: Text("PDF Document"),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.share),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         path: pdfurl);
//   }
// }



//     MaterialApp(home: Builder(builder: (context) {
//      print(widget.pdfUrl);
//       return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: Text('Plugin example app'),
//           ),
//           body: Stack(
//             children: <Widget>[
//               PdfView(
//                 path: widget.pdfUrl,

                


//               ),
//               !pdfReady
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Offstage()
//             ],
//           ));

//       //  MaterialButton(
//       //   onPressed: (() {
//       //     PdfView(path: pdfurl!);
//       //   }),
//       // ));
//     }));
//   }
// }
