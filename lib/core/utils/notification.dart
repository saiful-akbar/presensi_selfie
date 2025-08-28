import 'package:flutter/material.dart';

void notification(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: Duration(seconds: 10),
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
