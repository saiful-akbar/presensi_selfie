import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/presentation/pages/auth_page.dart';
import 'package:presensi_selfie/features/home/presentation/pages/home_page.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_bloc.dart';
import 'package:presensi_selfie/features/splash_screen/presentation/pages/splash_page.dart';

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
  };

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FMHO',
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: secondaryColor,
          onSecondary: Colors.white,
          tertiary: tertiaryColor,
          onTertiary: Colors.white,
          error: errorColor,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
          onSurfaceVariant: secondaryTextColor,
        ),
        appBarTheme: AppBarThemeData(surfaceTintColor: Colors.transparent),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 57,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          displayMedium: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: secondaryTextColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: errorColor, width: 2),
          ),
          hintStyle: TextStyle(color: secondaryTextColor, fontSize: 14),
          labelStyle: TextStyle(color: secondaryTextColor),
          floatingLabelStyle: TextStyle(color: primaryColor),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        dialogTheme: DialogThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
