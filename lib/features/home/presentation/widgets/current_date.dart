import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDate extends StatefulWidget {
  const CurrentDate({super.key});

  @override
  State<CurrentDate> createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  String _date = '';
  String _time = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();

    _date = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
    _time = DateFormat('HH:mm', 'id_ID').format(now);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();

      setState(() {
        _date = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
        _time = DateFormat('HH:mm', 'id_ID').format(now);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _date,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _time,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
