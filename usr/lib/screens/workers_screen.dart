import 'package:flutter/material.dart';
import '../models/worker.dart';
import '../widgets/status_indicator.dart';

class WorkersScreen extends StatefulWidget {
  const WorkersScreen({super.key});

  @override
  State<WorkersScreen> createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  final List<Worker> _workers = [
    Worker(
      id: '1',
      name: 'John Smith',
      isOnDuty: true,
      salary: 45000,
      position: 'Production Manager',
      department: 'Production',
      hireDate: DateTime(2020, 5, 15),
    ),
    Worker(
      id: '2',
      name: 'Sarah Johnson',
      isOnDuty: false,
      salary: 35000,
      position: 'Quality Control',
      department: 'Quality',
      hireDate: DateTime(2021, 3, 20),
    ),
    Worker(
      id: '3',
      name: 'Mike Davis',
      isOnDuty: true,
      salary: 28000,
      position: 'Machine Operator',
      department: 'Production',
      hireDate: DateTime(2022, 1, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workers Management'),
      ),
      body: ListView.builder(
        itemCount: _workers.length,
        itemBuilder: (context, index) {
          final worker = _workers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        worker.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      StatusIndicator(
                        isActive: worker.isOnDuty,
                        activeText: 'On Duty',
                        inactiveText: 'Off Duty',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Position: ${worker.position}'),
                  Text('Department: ${worker.department}'),
                  Text('Salary: ₹${worker.salary.toStringAsFixed(0)}/year'),
                  Text('Hire Date: ${worker.hireDate.toString().split(' ')[0]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}