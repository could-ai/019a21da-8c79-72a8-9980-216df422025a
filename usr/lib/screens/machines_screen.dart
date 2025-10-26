import 'package:flutter/material.dart';
import '../models/machine.dart';

class MachinesScreen extends StatefulWidget {
  const MachinesScreen({super.key});

  @override
  State<MachinesScreen> createState() => _MachinesScreenState();
}

class _MachinesScreenState extends State<MachinesScreen> {
  final List<Machine> _machines = [
    Machine(
      id: '1',
      name: 'CNC Machine A',
      status: MachineStatus.working,
      assignedWorkers: ['John Smith', 'Mike Davis'],
      location: 'Production Hall 1',
      lastMaintenance: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Machine(
      id: '2',
      name: 'Assembly Line B',
      status: MachineStatus.underMaintenance,
      assignedWorkers: ['Sarah Johnson'],
      location: 'Production Hall 2',
      lastMaintenance: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Machine(
      id: '3',
      name: 'Quality Control Station',
      status: MachineStatus.broken,
      assignedWorkers: [],
      location: 'Quality Control Room',
      lastMaintenance: DateTime.now().subtract(const Duration(days: 45)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Production Machines'),
      ),
      body: ListView.builder(
        itemCount: _machines.length,
        itemBuilder: (context, index) {
          final machine = _machines[index];
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
                        machine.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: machine.statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: machine.statusColor),
                        ),
                        child: Text(
                          machine.statusText,
                          style: TextStyle(
                            color: machine.statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Location: ${machine.location}'),
                  Text('Last Maintenance: ${machine.lastMaintenance.toString().split(' ')[0]}'),
                  const SizedBox(height: 8),
                  const Text('Assigned Workers:', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (machine.assignedWorkers.isEmpty)
                    const Text('No workers assigned')
                  else
                    ...machine.assignedWorkers.map((worker) => Text('• $worker')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}