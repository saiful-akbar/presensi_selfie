import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Color navigationBarColor;
  final Brightness navigationBarIconColor;

  const AppScaffold({
    super.key,
    required this.child,
    this.navigationBarColor = Colors.white,
    this.navigationBarIconColor = Brightness.dark,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: navigationBarIconColor,
      ),
      child: child,
    );
  }
}
