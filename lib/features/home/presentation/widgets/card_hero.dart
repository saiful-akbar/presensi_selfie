import 'package:flutter/material.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/current_date.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/current_presence.dart';

class CardHero extends StatefulWidget {
  const CardHero({super.key});

  @override
  State<CardHero> createState() => _CardHeroState();
}

class _CardHeroState extends State<CardHero> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            CurrentDate(),
            CurrentPresence(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.fingerprint_outlined),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                label: Text('Absen Pulang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
