import 'package:flutter/material.dart';

class NotificationUtil {
  final BuildContext context;
  final String message;
  final Color? backgroundColor;

  NotificationUtil(
    this.context, {
    required this.message,
    this.backgroundColor,
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
}
