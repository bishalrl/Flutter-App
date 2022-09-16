import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VIEW", style: TextStyle()),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  alignment: Alignment.center,
                  child: Text("view"),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  alignment: Alignment.center,
                  child: Text("read"),
                ),
                onTap: () {},
              ),
            )
          ],
        ));
  }
}

addData() async {}
