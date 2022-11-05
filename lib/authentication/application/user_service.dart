import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utiles/user_messages.dart';
import '../domain/user_provider.dart';

class AuthService {
  // provider instance
  static final _provider =
      (context) => Provider.of<AuthProvider>(context, listen: false);

//login functon accessible from UI
  static loginUserFromUI(BuildContext context,
      {required String email, required String password}) async {
    final result = _provider(context).loginUser(
      email: email,
      password: password,
    );
  }

//register functon accessible from UI
  static registerUserFromUI(BuildContext context,
      {required String email,
      required String password1,
      required String password2}) async {
    if (password1 != password2) {
      return snackbar(context, 'Password didn\'t match');
    }

    final result = await _provider(context).registerUser(
      email: email,
      password: password1,
    );

    if (result == 'OK') {
      snackbar(context, 'User registered Successfully.');
    } else {
      snackbar(context, result);
    }
  }
}
