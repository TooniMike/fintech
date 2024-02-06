import 'package:flutter/material.dart';

class SnackbarHelper {
  const SnackbarHelper._();
  static void showSnackBar(
      {required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This service is currently unavailable'),
      ),
    );
  }
}
