import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(body: Center(child: Text('Absen Masuk'))),
    );
  }
}
