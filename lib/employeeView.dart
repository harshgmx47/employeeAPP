import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/employee_model.dart';
import 'employeeCard.dart';
import 'viewModel/employee_Provider.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
      ),
      body: Consumer<EmployeeViewModel>(
        builder: (context, model, child) {
          if (model.employees.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: model.employees.length,
              itemBuilder: (context, index) {
                Employee employee = model.employees[index];
                return EmployeeCard(employee: employee);
              },
            );
          }
        },
      ),
    );
  }
}
