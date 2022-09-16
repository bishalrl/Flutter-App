import 'dart:convert';
import 'package:elibrary/pages/api.dart';
import 'package:elibrary/pages/login.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'api.dart';

class sigin extends StatefulWidget {
  const sigin({Key? key}) : super(key: key);

  @override
  State<sigin> createState() => _siginState();
}

class _siginState extends State<sigin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  _register() {
    var data = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = CallApi().postData(data, '/register');

    if (res == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 142, 209, 144),
          ),
          title: const Text(
            "Signup Page ",
            style: TextStyle(
              color: Color.fromARGB(255, 119, 30, 129),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: "Enter your user name",
                    labelText: "User name",
                    icon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  labelText: "password",
                  icon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Re-type Password",
                  labelText: "password",
                  icon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              MaterialButton(
                onPressed: () async {
                  _register();
                },
                child: const Text(
                  "submit",
                  style: TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
              )
            ])));
  }
}
