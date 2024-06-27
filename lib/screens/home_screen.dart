import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/model/post_model.dart';
import 'package:flutter_advance/model/member_model.dart';
import 'package:flutter_advance/screens/database_screen.dart';
import 'package:flutter_advance/screens/employee_screen.dart';
import 'package:flutter_advance/screens/login_screen.dart';
import 'package:flutter_advance/screens/network_screen.dart';
import 'package:flutter_advance/services/http_service.dart';
import 'package:flutter_advance/services/log_service.dart';
import 'package:flutter_advance/services/prefs_service.dart';
import 'package:flutter_advance/services/secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text("Flutter Module 6"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, EmployeeScreen.id);
            },
            child: const Text('Employee'),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text("str_packages").tr(),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text("str_localization").tr(),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, DatabaseScreen.id);
            },
            child: const Text("str_local_database").tr(),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, NetworkScreen.id);
            },
            child: const Text("str_networking").tr(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('uz', 'UZ'));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white),
                  child: const Text("Uzbek"),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('ru', 'RU'));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text("Russian")),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale('en', 'US'));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black),
                    child: const Text("English")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
