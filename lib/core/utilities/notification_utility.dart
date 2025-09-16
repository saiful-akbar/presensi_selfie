import 'package:flutter/material.dart';

class NotificationUtility {
  final BuildContext context;

  NotificationUtility(this.context);

  // Notifikasi sukses
  void success(String message) {
    _snackbar(message, Theme.of(context).colorScheme.secondary);
  }

  // Notifikasi error
  void error(String message) {
    _snackbar(message, Theme.of(context).colorScheme.error);
  }

  // Template notifikasi
  void _snackbar(String message, Color backgroundColor) {
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
