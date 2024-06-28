import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/firebase_options.dart';
import 'package:flutter_advance/screens/auth_screen.dart';
import 'package:flutter_advance/screens/database_screen.dart';
import 'package:flutter_advance/screens/employee_screen.dart';
import 'package:flutter_advance/screens/home_screen.dart';
import 'package:flutter_advance/screens/network_screen.dart';
import 'package:flutter_advance/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('local');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: const SplashScreen(),
      routes: {
        DatabaseScreen.id: (context) => const DatabaseScreen(),
        NetworkScreen.id: (context) => const NetworkScreen(),
        EmployeeScreen.id: (context) => const EmployeeScreen()
      },
    );
  }
}
