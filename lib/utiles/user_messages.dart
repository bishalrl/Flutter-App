import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

snackbar(BuildContext context, String? message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
      ),
    );
