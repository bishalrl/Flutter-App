//import 'package:axios/axios.dart';
//import 'package:http/http.dart' as http;

//import 'package:digital_library/pages/sigup_page.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import '../main.dart';
import '../utiles/route.dart';
import 'home.dart';
import 'sigup.dart';

//const SERVER_IP = 'http://localhost:3000';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // void displayDialog(BuildContext context, String title, String text) =>
  //     showDialog(
  //       context: context,
  //       builder: (context) =>
  //           AlertDialog(title: Text(title), content: Text(text)),
  //     );
  var height;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  _register() {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = CallApi().postData(data, '/login');
    // var body = json.decode(res.body);
    if (res == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else
      (print("Error occured"));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Column(children: [
      // Image.asset(
      //  "assets/images/111.jpeg",
      //   fit: BoxFit.cover,
      //   height: 300,
      // ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "welcome",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              //  validator: ,
              decoration: const InputDecoration(
                hintText: "Enter email",
                labelText: "email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                _register();
              }, // async
              //     async {
              //   var username = emailController.text;
              //   var password = passwordController.text;
              //   var jwt = await attemptLogIn(username, password);
              //   if (jwt != null) {
              //     storage.write(key: "jwt", value: jwt);
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HomePage.fromBase64(jwt)));
              //   } else {
              //     displayDialog(context, "An Error Occurred",
              //         "No account was found matching that username and password");
              //   }
              // },
              // setState(() {

              //  });

              //Navigator.pushNamed(context, Myroutes.homeRoute);

              child: (Container(
                height: 50,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 118, 162, 110),
                  borderRadius: BorderRadius.circular(25),
                ),
                // color: Colors.blueAccent,
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 24, 20, 73),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                onPressed: () // async
                    {
                  // setState(() {

                  //  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => sigin()));
                },
                child: (Container(
                    //padding: EdgeInsets.all(10),
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // color: Colors.blueAccent,
                    child: const Text(
                      "signup",
                      style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "forget password",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ]),
          ],
        ),
      )
    ])));
  }

  // attemptLogIn(String username, String password) async {
  //   var http;
  //   var res = await http.post("$SERVER_IP/login",
  //       body: {"username": username, "password": password});
  //   if (res.statusCode == 200) return res.body;
  //   return null;
  // }

  // ),
  // ElevatedButton(
  //    onPressed: () {
  //   Navigator.pushNamed(context, Myroutes.homeRoute);
  //  },
  // child: Text("Login"),
  // style: TextButton.styleFrom(minimumSize: Size(120, 30)),
  //),
}
