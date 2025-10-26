class InventoryItem {
  final String id;
  final String name;
  final String category;
  final int quantity;
  final int minThreshold;
  final double unitPrice;
  final String unit;
  final DateTime lastUpdated;

  InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.minThreshold,
    required this.unitPrice,
    required this.unit,
    required this.lastUpdated,
  });

  factory InventoryItem.fromMap(Map<String, dynamic> map) {
    return InventoryItem(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      quantity: map['quantity'],
      minThreshold: map['minThreshold'],
      unitPrice: map['unitPrice'],
      unit: map['unit'],
      lastUpdated: DateTime.parse(map['lastUpdated']),
    );
  }

  bool get isLowStock => quantity <= minThreshold;
}