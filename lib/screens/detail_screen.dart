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
        title: Text(employee.employeeName!),
      ),
    );
  }
}
