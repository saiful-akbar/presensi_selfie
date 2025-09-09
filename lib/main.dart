import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/presentation/pages/auth_page.dart';
import 'package:presensi_selfie/features/home/presentation/pages/home_page.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_bloc.dart';
import 'package:presensi_selfie/features/presence/presentation/pages/check_in_page.dart';
import 'package:presensi_selfie/features/presence/presentation/pages/check_out_page.dart';
import 'package:presensi_selfie/features/splash_screen/presentation/pages/splash_page.dart';
import 'package:presensi_selfie/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final primaryTextColor = Color.fromRGBO(24, 24, 24, 1);
  static final secondaryTextColor = Color.fromRGBO(149, 149, 149, 1);
  static final primaryColor = Color.fromRGBO(65, 96, 136, 1);
  static final secondaryColor = Color.fromRGBO(22, 174, 38, 1);
  static final tertiaryColor = Color.fromRGBO(235, 134, 1, 1);
  static final errorColor = Color.fromRGBO(207, 13, 13, 1);
  static final double borderRadius = 8;

  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    '/login': (context) => const AuthPage(),
    '/home': (context) => const HomePage(),
    '/check-in': (context) => const CheckInPage(),
    '/check-out': (context) => const CheckOutPage(),
  };

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FMHO',
      initialRoute: '/',
      routes: routes,
      theme: AppTheme.lightTheme(),
    );
  }
}
