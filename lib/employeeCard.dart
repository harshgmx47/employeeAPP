import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    bool isActive = employee.active;
    bool isOver5Years =
        DateTime.now().difference(employee.joinDate).inDays > 1825;
    bool flag = isActive && isOver5Years;
    return Card(
      elevation: 4,
      color: flag ? Colors.green[100] : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 32,
              // backgroundImage: NetworkImage(employee.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Joined: ${dateFormat.format(employee.joinDate)}'),
                  const SizedBox(height: 8),
                  Text(
                    isActive ? 'Active' : 'Not Active',
                    style: TextStyle(
                      color: isActive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
