import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/financial_data.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final List<FinancialData> _salesData = [
    FinancialData(
      id: '1',
      type: 'income',
      category: 'Product A',
      description: 'Bulk sale to Company X',
      amount: 75000,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    FinancialData(
      id: '2',
      type: 'income',
      category: 'Product B',
      description: 'Retail sales',
      amount: 25000,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    FinancialData(
      id: '3',
      type: 'income',
      category: 'Product C',
      description: 'Export order',
      amount: 120000,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sales Management'),
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
      itemCount: _salesData.length,
      itemBuilder: (context, index) {
        final data = _salesData[index];
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
                      '+₹${data.amount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('Product: ${data.category}'),
                Text('Date: ${data.date.toString().split(' ')[0]}'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChartsView() {
    final categoryTotals = <String, double>{};
    for (final data in _salesData) {
      categoryTotals[data.category] = (categoryTotals[data.category] ?? 0) + data.amount;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Sales by Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                barGroups: categoryTotals.entries.map((entry) {
                  return BarChartGroupData(
                    x: categoryTotals.keys.toList().indexOf(entry.key),
                    barRods: [
                      BarChartRodData(
                        toY: entry.value,
                        color: Colors.blue,
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < categoryTotals.keys.length) {
                          return Text(categoryTotals.keys.elementAt(value.toInt()));
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}