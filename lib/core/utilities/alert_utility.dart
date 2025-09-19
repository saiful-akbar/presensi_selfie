import 'package:flutter/material.dart';

class AlertUtility {
  final BuildContext context;

  AlertUtility(this.context);

  Future<T?> show<T>({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: title,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            content: content,
            contentTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            actions: actions,
            actionsPadding: actionsPadding,
            actionsAlignment: actionsAlignment,
            actionsOverflowAlignment: actionsOverflowAlignment,
            actionsOverflowDirection: actionsOverflowDirection,
            actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          ),
        );
      },
    );
  }
}
