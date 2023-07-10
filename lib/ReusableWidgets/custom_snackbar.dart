import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar._();
  static buildErrorSnackbar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
