import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/card_hero.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/menu.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_bloc.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 25,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [CardHero(), Menu()],
            ),
          ),
        );
      },
    );
  }
}
