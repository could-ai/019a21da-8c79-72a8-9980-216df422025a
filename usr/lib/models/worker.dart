class Worker {
  final String id;
  final String name;
  final bool isOnDuty;
  final double salary;
  final String position;
  final String department;
  final DateTime hireDate;

  Worker({
    required this.id,
    required this.name,
    required this.isOnDuty,
    required this.salary,
    required this.position,
    required this.department,
    required this.hireDate,
  });

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      id: map['id'],
      name: map['name'],
      isOnDuty: map['isOnDuty'],
      salary: map['salary'],
      position: map['position'],
      department: map['department'],
      hireDate: DateTime.parse(map['hireDate']),
    );
  }
}