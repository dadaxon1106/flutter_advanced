import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/model/emp_model.dart';
import 'package:flutter_advance/screens/detail_screen.dart';
import 'package:flutter_advance/services/emp_service.dart';
import 'package:flutter_advance/services/log_service.dart';

class EmployeeScreen extends StatefulWidget {
  static const id = '/employee';

  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  bool isLoading = false;
  var items = [];

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  void _getApi() async {
    setState(() {
      isLoading = true;
    });
    var response =
        await EmpService.GET(EmpService.API_LIST, EmpService.paramsEmpty());
    if (response != null) {
      setState(() {
        isLoading = false;
        items = employeesFromJson(response).data!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              final employee = items[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (ctx) =>
                                DetailScreen(employee: employee)));
                  },
                  child: makeEmp(items[index]));
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget makeEmp(Employee emp) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            emp.employeeName.toString(),
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            emp.employeeSalary.toString(),
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            emp.employeeAge.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
