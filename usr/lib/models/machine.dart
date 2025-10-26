import 'package:flutter/material.dart';

enum MachineStatus { working, underMaintenance, broken }

class Machine {
  final String id;
  final String name;
  final MachineStatus status;
  final List<String> assignedWorkers;
  final String location;
  final DateTime lastMaintenance;

  Machine({
    required this.id,
    required this.name,
    required this.status,
    required this.assignedWorkers,
    required this.location,
    required this.lastMaintenance,
  });

  factory Machine.fromMap(Map<String, dynamic> map) {
    return Machine(
      id: map['id'],
      name: map['name'],
      status: MachineStatus.values[map['status']],
      assignedWorkers: List<String>.from(map['assignedWorkers']),
      location: map['location'],
      lastMaintenance: DateTime.parse(map['lastMaintenance']),
    );
  }

  String get statusText {
    switch (status) {
      case MachineStatus.working:
        return 'Working';
      case MachineStatus.underMaintenance:
        return 'Under Maintenance';
      case MachineStatus.broken:
        return 'Broken';
    }
  }

  Color get statusColor {
    switch (status) {
      case MachineStatus.working:
        return Colors.green;
      case MachineStatus.underMaintenance:
        return Colors.orange;
      case MachineStatus.broken:
        return Colors.red;
    }
  }
}