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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [CurrentDate(), CurrentPresence()],
          ),
        ),
      ),
    );
  }
}
