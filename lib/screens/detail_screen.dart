import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/emp_model.dart';

class DetailScreen extends StatelessWidget {
  final Employee employee;
  const DetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${employee.id}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ishchi Ismi: ${employee.employeeName!}",
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            Text(
              "Oyligi: ${employee.employeeSalary!} mln so'm",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );  
  }
}
