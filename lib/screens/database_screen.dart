import 'package:flutter/material.dart';
import 'package:flutter_advance/model/user_model.dart';
import 'package:flutter_advance/services/hive_service.dart';
import 'package:flutter_advance/services/log_service.dart';

class DatabaseScreen extends StatefulWidget {
  static const id = "/database";
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    var user = UserModel('John', 14343544, 6000000.0);
    HiveService.putUser(user);
    var result = HiveService.getUser();
    LogService.e(result.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Local Database",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
