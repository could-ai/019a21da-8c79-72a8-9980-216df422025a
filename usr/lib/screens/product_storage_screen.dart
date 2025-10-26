import 'package:flutter/material.dart';
import '../models/inventory_item.dart';

class ProductStorageScreen extends StatefulWidget {
  const ProductStorageScreen({super.key});

  @override
  State<ProductStorageScreen> createState() => _ProductStorageScreenState();
}

class _ProductStorageScreenState extends State<ProductStorageScreen> {
  final List<InventoryItem> _products = [
    InventoryItem(
      id: '1',
      name: 'Widget A',
      category: 'Electronics',
      quantity: 150,
      minThreshold: 50,
      unitPrice: 25.50,
      unit: 'pieces',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    InventoryItem(
      id: '2',
      name: 'Component B',
      category: 'Mechanical',
      quantity: 75,
      minThreshold: 100,
      unitPrice: 45.00,
      unit: 'pieces',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    InventoryItem(
      id: '3',
      name: 'Assembly C',
      category: 'Finished Goods',
      quantity: 200,
      minThreshold: 30,
      unitPrice: 125.75,
      unit: 'units',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Storage'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
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
                        product.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      if (product.isLowStock)
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
                  Text('Category: ${product.category}'),
                  Text('Quantity: ${product.quantity} ${product.unit}'),
                  Text('Min Threshold: ${product.minThreshold} ${product.unit}'),
                  Text('Unit Price: ₹${product.unitPrice.toStringAsFixed(2)}'),
                  Text('Total Value: ₹${(product.quantity * product.unitPrice).toStringAsFixed(2)}'),
                  Text('Last Updated: ${product.lastUpdated.toString().split('.')[0]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}