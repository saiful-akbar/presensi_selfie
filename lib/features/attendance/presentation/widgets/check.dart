import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckAttendace(
          icon: Icons.login,
          iconColor: Theme.of(context).colorScheme.secondary,
          time: '00:00',
          label: 'Masuk',
        ),
        CheckAttendace(
          icon: Icons.logout,
          iconColor: Theme.of(context).colorScheme.error,
          time: '00:00',
          label: 'Pulang',
        ),
        CheckAttendace(
          icon: Icons.hourglass_empty,
          iconColor: Theme.of(context).colorScheme.onSurface,
          time: '00:00',
          label: 'Total Jam',
        ),
      ],
    );
  }
}

class CheckAttendace extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String time;
  final String label;

  const CheckAttendace({
    super.key,
    required this.icon,
    this.iconColor = Colors.black,
    required this.time,
    required this.label,
  });

  @override
  State<CheckAttendace> createState() => _CheckAttendaceState();
}

class _CheckAttendaceState extends State<CheckAttendace> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        children: [
          Icon(widget.icon, color: widget.iconColor),
          Text(widget.time, style: Theme.of(context).textTheme.titleLarge),
          Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
