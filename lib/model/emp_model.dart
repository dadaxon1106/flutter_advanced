import 'dart:convert';

EmpResponse employeesFromJson(String str) =>
    EmpResponse.fromJson(json.decode(str));
String employeesToJson(EmpResponse data) => json.encode(data.toJson());

class EmpResponse {
  String? status;
  List<Employee>? data;
  String? message;

  EmpResponse({this.status, this.data, this.message});

  factory EmpResponse.fromJson(Map<String, dynamic> json) => EmpResponse(
      status: json['status'],
      data: List<Employee>.from(json['data'].map((x) => Employee.fromJson(x))),
      message: json['message']);
  Map<String, dynamic> toJson() => {
        'status': status,
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
        'message': message,
      };
}

class Employee {
  int? id;
  String? employeeName;
  int? employeeAge;
  int? employeeSalary;
  String? profileImage;

  Employee(
      {this.id,
      this.employeeName,
      this.employeeAge,
      this.employeeSalary,
      this.profileImage});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        employeeName: json['employee_name'],
        employeeAge: json['employee_age'],
        employeeSalary: json['employee_salary'],
        profileImage: json['profile_image']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'employee_name': employeeName,
        'employee_age': employeeAge,
        'employee_Salary': employeeSalary,
        'profile_image': profileImage
      };
}
