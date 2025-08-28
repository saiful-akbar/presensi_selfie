import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/utils/notification.dart';
import 'package:presensi_selfie/core/utils/random_string.dart';
import 'package:presensi_selfie/core/widgets/loading_dialog.dart';
import 'package:presensi_selfie/features/auth/application/usecases/save_auth_token_use_case.dart';

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

    if (_userId.text != '4154' || _password.text != '4154') {
      if (mounted) {
        notification(
          context,
          message: 'Periksa kembali ID karyawan atau kata sandi anda.',
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }

      return;
    }

    _showLoading();

    final String randomString = RandomString.generate(32);

    try {
      await SaveAuthTokenUseCase.handle(randomString);

      if (mounted) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);

        notification(
          context,
          message: 'Login gagal.',
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
            onFieldSubmitted: (value) => _submitForm(),
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
