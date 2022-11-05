//import 'package:digital_library/computer/semistar1.dart';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:elibrary/firebase/pdfview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/computer_engineering_provider.dart';

class Computer extends StatelessWidget {
  const Computer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ComputerEngineeringProvider>().getSem1Notes();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Computer Engineering",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 103, 188, 105),
            ),
          ),
        ),
        body: Consumer<ComputerEngineeringProvider>(
            builder: (context, computer, child) => ListView.builder(
                itemCount: computer.notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: ListTile(
                        title: Text(computer.notes[index].title
                            .toString()
                            .toUpperCase()),
                      ),
                      onTap: () {
                        //             Fun(pdfUrl: computer.notes[index].pdfUrl!)));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Fun(
                                    pdfUrl: computer.notes[index].pdfUrl!)));

                        // PDFDocument doc = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');                      PDFDocument doc = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');
                      });
                })));
  }
}
