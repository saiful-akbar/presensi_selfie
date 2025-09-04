import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/core/utils/notification_util.dart';
import 'package:presensi_selfie/core/widgets/loading_dialog.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/usecases/login_use_case.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/infrastructure/dtos/login_dto.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _userId = TextEditingController(text: '');
  final _password = TextEditingController(text: '');

  bool _showPassword = false;

  // Toggle show or hide password
  void _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // Show loading
  void _showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return LoadingDialog(message: 'Memproses');
      },
    );
  }

  // Submit form
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _showLoading();

    final useCase = LoginUseCase(
      LoginDTO(username: _userId.text, password: _password.text),
    );

    try {
      final AuthUserEntity? user = await useCase.handle();

      if (user != null && mounted) {
        context.read<AuthBloc>().add(SaveAuthToken(user.token));
        context.read<AuthBloc>().add(SaveAuthUser(user));

        if (mounted) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        FocusManager.instance.primaryFocus?.unfocus();
        NotificationUtil(
          context,
          message: e.toString(),
          backgroundColor: Theme.of(context).colorScheme.error,
        );
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
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'ID karyawan tidak boleh kosong.'
                  : null;
            },
          ),
          TextFormField(
            controller: _password,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: !_showPassword,
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
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Kata sandi tidak boleh kosong'
                  : null;
            },
            onFieldSubmitted: (value) {
              _submitForm();
            },
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            label: Text('Login'),
            icon: Icon(Icons.login),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
