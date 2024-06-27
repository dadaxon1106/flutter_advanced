import 'package:flutter/material.dart';
import 'package:flutter_advance/services/auth_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Lesson"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService.logOut(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, foregroundColor: Colors.white),
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
