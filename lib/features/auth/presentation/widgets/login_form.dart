import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/core/utilities/loading_utility.dart';
import 'package:presensi_selfie/core/utilities/notification_utility.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/usecases/login_use_case.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_area_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_department_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_language_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_level_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_position_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_shift_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _userId = TextEditingController(text: '');
  final _password = TextEditingController(text: '');

  late LoadingUtility _loading;
  late NotificationUtility _notification;

  bool _showPassword = false;

  @override
  void initState() {
    super.initState();

    _loading = LoadingUtility(context);
    _notification = NotificationUtility(context);
  }

  // Validasi form
  String? _validation(String field, String? value) {
    if (field == 'userId') {
      if (value == null || value.isEmpty) {
        return 'ID Karyawan tidak boleh kosong';
      }
    }

    if (field == 'password') {
      if (value == null || value.isEmpty) {
        return 'Kata sandi tidak boleh kosong';
      }
    }

    return null;
  }

  // Toggle show or hide password
  void _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // Submit form
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _loading.show('Memproses...');

    try {
      final Map<String, dynamic> data = await LoginUseCase.handle(
        LoginDTO(username: _userId.text.toString(), password: _password.text.toString()),
      );

      final user = data;
      final token = user['token'];
      final language = user['language'];
      final level = user['level'];
      final department = user['departement'];
      final position = user['position'];
      final area = user['area'];
      final shift = user['shift'];

      if (mounted) {
        context.read<AuthBloc>().add(SaveAuthToken(token));
        context.read<AuthBloc>().add(SaveAuthUser(AuthUserEntity.fromJson(user)));
        context.read<AuthBloc>().add(SaveAuthLanguage(AuthLanguageEntity.fromJson(language)));
        context.read<AuthBloc>().add(SaveAuthLevel(AuthLevelEntity.fromJson(level)));
        context.read<AuthBloc>().add(SaveAuthDepartment(AuthDepartmentEntity.fromJson(department)));
        context.read<AuthBloc>().add(SaveAuthPosition(AuthPositionEntity.fromJson(position)));
        context.read<AuthBloc>().add(SaveAuthArea(AuthAreaEntity.fromJson(area)));
        context.read<AuthBloc>().add(SaveAuthShift(AuthShiftEntity.fromJson(shift)));

        Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        FocusManager.instance.primaryFocus?.unfocus();
        _notification.error(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          TextFormField(
            controller: _userId,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(label: Text('ID Karyawan')),
            validator: (value) => _validation('userId', value),
          ),
          TextFormField(
            controller: _password,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: !_showPassword,
            validator: (value) => _validation('password', value),
            decoration: InputDecoration(
              label: Text('Kata Sandi'),
              suffixIcon: IconButton(
                onPressed: _togglePassword,
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            label: Text('Login'),
            icon: Icon(Icons.login),
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
          ),
        ],
      ),
    );
  }
}
