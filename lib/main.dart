import 'package:elibrary/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'utiles/route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';

final storage = FlutterSecureStorage();

class FlutterSecureStorage {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: MaterialApp(
      routes: {
        "/": (context) => HomePage(),
        Myroutes.homeRoute: ((context) => const HomePage()),
        Myroutes.LoginRoute: ((context) => LoginPage())
      },
    ));
  }
}

// MaterialApp({required Map<String, Object Function(dynamic context)> routes}) {}
 