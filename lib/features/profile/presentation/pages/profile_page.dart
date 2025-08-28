import 'package:flutter/material.dart';
import 'package:presensi_selfie/features/auth/application/usecases/logout_use_case.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout() async {
    await LogoutUseCase.handle();

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: FilledButton(
          onPressed: _logout,
          style: FilledButton.styleFrom(
            backgroundColor: Colors.red[400],
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Logout'),
        ),
      ),
    );
  }
}
