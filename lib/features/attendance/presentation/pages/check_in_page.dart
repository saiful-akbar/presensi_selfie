import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/attendance/presentation/widgets/address.dart';
import 'package:presensi_selfie/features/attendance/presentation/widgets/check.dart';
import 'package:presensi_selfie/features/attendance/presentation/widgets/photo_button.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  String _currentTime = '';
  String _currentDate = '';

  @override
  void initState() {
    super.initState();

    setState(() {
      final now = DateTime.now();
      _currentTime = DateFormat('HH:mm').format(now);
      _currentDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: AppBar(title: Text('Absen Masuk'), centerTitle: true),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        _currentTime.toString(),
                        style: TextStyle(
                          fontSize: 45,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        _currentDate.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PhotoButton(),
              Check(),
              Address(),
            ],
          ),
        ),
      ),
    );
  }
}
