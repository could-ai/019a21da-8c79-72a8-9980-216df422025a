import 'package:flutter/material.dart';
import '../models/inventory_item.dart';

class RawMaterialsScreen extends StatefulWidget {
  const RawMaterialsScreen({super.key});

  @override
  State<RawMaterialsScreen> createState() => _RawMaterialsScreenState();
}

class _RawMaterialsScreenState extends State<RawMaterialsScreen> {
  final List<InventoryItem> _rawMaterials = [
    InventoryItem(
      id: '1',
      name: 'Steel Sheets',
      category: 'Metal',
      quantity: 500,
      minThreshold: 200,
      unitPrice: 15.25,
      unit: 'kg',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    InventoryItem(
      id: '2',
      name: 'Plastic Pellets',
      category: 'Polymer',
      quantity: 150,
      minThreshold: 300,
      unitPrice: 8.50,
      unit: 'kg',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    InventoryItem(
      id: '3',
      name: 'Copper Wire',
      category: 'Electrical',
      quantity: 800,
      minThreshold: 150,
      unitPrice: 22.00,
      unit: 'meters',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 4)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raw Materials Storage'),
      ),
      body: ListView.builder(
        itemCount: _rawMaterials.length,
        itemBuilder: (context, index) {
          final material = _rawMaterials[index];
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
                        material.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      if (material.isLowStock)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Low Stock',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Category: ${material.category}'),
                  Text('Quantity: ${material.quantity} ${material.unit}'),
                  Text('Min Threshold: ${material.minThreshold} ${material.unit}'),
                  Text('Unit Price: ₹${material.unitPrice.toStringAsFixed(2)}'),
                  Text('Total Value: ₹${(material.quantity * material.unitPrice).toStringAsFixed(2)}'),
                  Text('Last Updated: ${material.lastUpdated.toString().split('.')[0]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}