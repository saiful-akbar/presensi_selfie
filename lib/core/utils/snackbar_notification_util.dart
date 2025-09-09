import 'package:flutter/material.dart';

class SnackbarNotification {
  final BuildContext context;
  final String message;
  final Color? backgroundColor;

  SnackbarNotification(
    this.context, {
    required this.message,
    this.backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 5),
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
}
