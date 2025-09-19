import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utilities/alert_utility.dart';
import 'package:presensi_selfie/core/utilities/notification_utility.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/dtos/update_area_dto.dart';
import 'package:presensi_selfie/features/auth/application/usecases/update_area_use_case.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/check_absence/presentation/pages/check_absence_page.dart';
import 'package:presensi_selfie/features/home/presentation/pages/home_tab.dart';
import 'package:presensi_selfie/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:presensi_selfie/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [HomeTab(), CheckAbsencePage(), ProfilePage()];
  late NotificationUtility _notification;
  late AlertUtility _alert;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _notification = NotificationUtility(context);
    _alert = AlertUtility(context);

    Future.microtask(() async {
      _checkStatusArea();
    });
  }

  // cek status area.
  Future<void> _checkStatusArea() async {
    final AuthUserEntity user = context.read<AuthBloc>().state.user!;
    final DateTime? areaChangeDate = user.areaChangeDate;

    if (user.isUnderHo) {
      return;
    }

    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final userAreaChangeDate = areaChangeDate is DateTime
        ? DateFormat('yyyy-MM-dd').format(areaChangeDate)
        : null;

    if (currentDate != userAreaChangeDate) {
      _alert.show(
        title: Text('Status Area'),
        content: Text('Sebagai SA apa kamu hari ini?'),
        actionsOverflowButtonSpacing: 10,
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _updateStatusArea(3);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text('Mobile'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _updateStatusArea(4);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Text('Mobile Stay'),
            ),
          ),
        ],
      );
    }
  }

  // Update status area.
  Future<void> _updateStatusArea(int areaId) async {
    final user = context.read<AuthBloc>().state.user!;
    final token = context.read<AuthBloc>().state.token!;

    try {
      await UpdateAreaUseCase.handle(
        UpdateAreaDTO(authToken: token, username: user.username, areaId: areaId),
      );
    } catch (e) {
      _notification.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        extendBody: false,
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigation(
          index: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
