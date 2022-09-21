import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isLoggingInUser = false;
  bool get isLoggingInUser => _isLoggingInUser;

  bool _creatingUser = false;
  bool get creatingUser => _creatingUser;

  Future<String> loginUser(
      {required String email, required String password}) async {
    _isLoggingInUser = true;
    notifyListeners();

    String result = 'OK';

    try {
      //implementation of user login

      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      result = e.toString();
    }
    _isLoggingInUser = false;
    notifyListeners();
    return result;
  }

  Future<String> registerUser(
      {required String email, required String password}) async {
    String result = 'OK';
    _creatingUser = true;
    notifyListeners();

    try {
      // implementation of register user

      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      result = e.toString();
    }

    _creatingUser = false;
    notifyListeners();
    return result;
  }
}
