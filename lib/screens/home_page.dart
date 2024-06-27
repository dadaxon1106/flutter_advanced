import 'package:flutter/material.dart';
import 'package:flutter_advance/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: MaterialButton(
            color: Colors.red,
            onPressed: () {
              AuthService.logOut(context);
            },
            child: Text(
              "LogOut",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
