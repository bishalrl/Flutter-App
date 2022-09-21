import 'dart:convert';
import 'package:elibrary/pages/api.dart';
import 'package:elibrary/pages/login.dart';
import 'package:flutter/material.dart';

import '../application/user_service.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                controller: password1Controller,
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
                controller: password2Controller,
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
                  AuthService.registerUserFromUI(
                    context,
                    email: emailController.text.trim(),
                    password1: password1Controller.text.trim(),
                    password2: password2Controller.text.trim(),
                  );
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
