import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Fun4 extends StatefulWidget {
  @override
  _Fun4State createState() => _Fun4State();
}

class _Fun4State extends State<Fun4> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromURL(
        'https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2Fexception-handling019-355.pdf?alt=media&token=c58897c7-658c-476e-b151-bb6f98818f7d',
      );
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        'https://firebasestorage.googleapis.com/v0/b/e-library-eb4b4.appspot.com/o/files%2FPROPOSAL.pdf?alt=media&token=b31089dd-3bc9-4ad2-9cb7-61ca3bd94a93',
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 36),
            ListTile(
              title: Text('programming technology'),
              onTap: () {
                changePDF(1);
              },
            ),
            ListTile(
              title: Text('proposal'),
              onTap: () {
                changePDF(2);
              },
            ),
            ListTile(
              title: Text('Restore default'),
              onTap: () {
                changePDF(3);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('FlutterPluginPDFViewer'),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                // lazyLoad: false,
                // uncomment below line to scroll vertically
                // scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                /* navigationBuilder:
                          (context, page, totalPages, jumpToPage, animateToPage) {
                        return ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.first_page),
                              onPressed: () {
                                jumpToPage()(page: 0);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                animateToPage(page: page - 2);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                animateToPage(page: page);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.last_page),
                              onPressed: () {
                                jumpToPage(page: totalPages - 1);
                              },
                            ),
                          ],
                        );
                      }, */
              ),
      ),
    );
  }
}
