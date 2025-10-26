import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/financial_data.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final List<FinancialData> _financialData = [
    FinancialData(
      id: '1',
      type: 'income',
      category: 'Sales',
      description: 'Product sales',
      amount: 50000,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    FinancialData(
      id: '2',
      type: 'expense',
      category: 'Raw Materials',
      description: 'Steel purchase',
      amount: 25000,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    FinancialData(
      id: '3',
      type: 'income',
      category: 'Services',
      description: 'Maintenance service',
      amount: 15000,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finance Management'),
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
      itemCount: _financialData.length,
      itemBuilder: (context, index) {
        final data = _financialData[index];
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
                      '${data.type == 'income' ? '+' : '-'}₹${data.amount.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: data.type == 'income' ? Colors.green : Colors.red,
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
        );
      },
    );
  }

  Widget _buildChartsView() {
    final income = _financialData.where((d) => d.type == 'income').fold(0.0, (sum, d) => sum + d.amount);
    final expense = _financialData.where((d) => d.type == 'expense').fold(0.0, (sum, d) => sum + d.amount);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Income vs Expenses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: income,
                    title: 'Income\n₹${income.toStringAsFixed(0)}',
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: expense,
                    title: 'Expenses\n₹${expense.toStringAsFixed(0)}',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}