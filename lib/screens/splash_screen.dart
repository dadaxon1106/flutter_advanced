import 'package:flutter/material.dart';
import 'package:flutter_advance/screens/home_screen.dart';
import 'package:flutter_advance/screens/login_screen.dart';
import 'package:flutter_advance/screens/main_page.dart';
import 'package:flutter_advance/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => {
              if (AuthService.isLogged())
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MainPage()))
                }
              else
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1)
            ])),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            Text(
              "All rights reserved",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
