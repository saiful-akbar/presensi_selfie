import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utilities/notification_utility.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_bloc.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_event.dart';
import 'package:presensi_selfie/features/attendance/application/dtos/today_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/application/usecases/get_today_attendance_use_case.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CurrentPresence extends StatefulWidget {
  const CurrentPresence({super.key});

  @override
  State<CurrentPresence> createState() => _CurrentPresenceState();
}

class _CurrentPresenceState extends State<CurrentPresence> {
  late NotificationUtility _notification;

  String _timeIn = '00:00';
  String _timeOut = '00:00';
  bool _loading = true;

  // Request data attendance
  Future<void> _getTodayAttendance() async {
    final attedance = context.read<AttendanceBloc>().state.todayAttendance;

    if (attedance == null) {
      final auth = context.read<AuthBloc>().state;
      final token = auth.token!;
      final username = auth.user!.username;

      setState(() {
        _loading = true;
      });

      try {
        final response = await GetTodayAttendanceUseCase.handle(
          TodayAttendanceDTO(authToken: token, username: username),
        );

        if (response != null) {
          setState(() {
            _timeIn = DateFormat('HH:mm').format(response.timeIn);
            _timeOut = DateFormat('HH:mm').format(response.timeOut);
          });

          if (mounted) {
            context.read<AttendanceBloc>().add(SaveTodayAttendance(response));
          }
        }
      } catch (e) {
        _notification.error(e.toString());
      } finally {
        setState(() {
          _loading = false;
        });
      }
    } else {
      setState(() {
        _timeIn = DateFormat('HH:mm').format(attedance.timeIn);
        _timeOut = DateFormat('HH:mm').format(attedance.timeOut);
      });
    }
  }

  // Initial state.
  @override
  void initState() {
    super.initState();

    // Inisialisasi properti.
    _notification = NotificationUtility(context);

    // Jalankan method
    _getTodayAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    _loading
                        ? Shimmer.fromColors(
                            baseColor: Theme.of(context).colorScheme.primary,
                            highlightColor: Colors.grey.shade100,
                            child: Text(
                              '00:00',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            _timeIn,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),

                Container(
                  width: 2,
                  height: 30,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      'Pulang',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    _loading
                        ? Shimmer.fromColors(
                            baseColor: Theme.of(context).colorScheme.primary,
                            highlightColor: Colors.grey.shade100,
                            child: Text(
                              '00:00',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            _timeOut,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
