class FinancialData {
  final String id;
  final String type; // 'income' or 'expense'
  final String category;
  final String description;
  final double amount;
  final DateTime date;

  FinancialData({
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    required this.amount,
    required this.date,
  });

  factory FinancialData.fromMap(Map<String, dynamic> map) {
    return FinancialData(
      id: map['id'],
      type: map['type'],
      category: map['category'],
      description: map['description'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}