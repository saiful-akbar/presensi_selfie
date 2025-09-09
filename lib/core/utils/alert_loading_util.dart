import 'package:flutter/material.dart';

class AlertLoading {
  final BuildContext context;
  final String message;

  AlertLoading({required this.context, this.message = 'Memproses...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      fullscreenDialog: true,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 15,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
