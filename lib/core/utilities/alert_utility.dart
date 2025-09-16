import 'package:flutter/material.dart';

class AlertUtility {
  final BuildContext context;

  AlertUtility(this.context);

  void show({Widget? title, Widget? content, List<Widget>? actions}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          content: content,
          contentTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          actions: actions,
        );
      },
    );
  }
}
