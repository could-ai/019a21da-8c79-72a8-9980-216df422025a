import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/financial_data.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  final List<FinancialData> _purchasesData = [
    FinancialData(
      id: '1',
      type: 'expense',
      category: 'Raw Materials',
      description: 'Steel sheets bulk purchase',
      amount: 45000,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    FinancialData(
      id: '2',
      type: 'expense',
      category: 'Equipment',
      description: 'New CNC machine',
      amount: 150000,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    FinancialData(
      id: '3',
      type: 'expense',
      category: 'Supplies',
      description: 'Office supplies',
      amount: 5000,
      date: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Purchases Management'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Charts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDetailsView(),
            _buildChartsView(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsView() {
    return ListView.builder(
      itemCount: _purchasesData.length,
      itemBuilder: (context, index) {
        final data = _purchasesData[index];
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
                        data.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      Text(
                        '-₹${data.amount.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text('Category: ${data.category}'),
                  Text('Date: ${data.date.toString().split(' ')[0]}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildChartsView() {
    final categoryTotals = <String, double>{};
    for (final data in _purchasesData) {
      categoryTotals[data.category] = (categoryTotals[data.category] ?? 0) + data.amount;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Purchases by Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: categoryTotals.entries.map((entry) {
                  return PieChartSectionData(
                    value: entry.value,
                    title: '${entry.key}\n₹${entry.value.toStringAsFixed(0)}',
                    color: Colors.primaries[categoryTotals.keys.toList().indexOf(entry.key) % Colors.primaries.length],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}