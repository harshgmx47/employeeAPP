// ignore: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/employee_model.dart';

class EmployeeViewModel extends ChangeNotifier {
  late List<Employee> _employees;
  List<Employee> get employees => _employees;

  final DateFormat _dateFormat = DateFormat("dd-MM-yyyy");

  EmployeeViewModel() {
    _employees = [];
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    final url =
        Uri.parse('https://node-employee-api-gray.vercel.app/api/employees');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _employees =
          jsonResponse.map((employee) => Employee.fromJson(employee)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }
}
