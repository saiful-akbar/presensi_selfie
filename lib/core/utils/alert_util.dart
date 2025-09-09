import 'package:flutter/material.dart';

class Alert {
  final BuildContext context;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  Alert(this.context, {this.title, this.content, this.actions}) {
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
