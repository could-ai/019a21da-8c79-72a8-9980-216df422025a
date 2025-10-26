import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/worker.dart';
import '../models/machine.dart';
import '../models/inventory_item.dart';
import '../models/financial_data.dart';
import 'workers_screen.dart';
import 'finance_screen.dart';
import 'sales_screen.dart';
import 'purchases_screen.dart';
import 'product_storage_screen.dart';
import 'raw_materials_screen.dart';
import 'machines_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Management Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _buildDashboardCard(
            context,
            'Workers',
            Icons.people,
            Colors.blue,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WorkersScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Finance',
            Icons.account_balance,
            Colors.green,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FinanceScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Sales',
            Icons.trending_up,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SalesScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Purchases',
            Icons.shopping_cart,
            Colors.orange,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PurchasesScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Product Storage',
            Icons.inventory,
            Colors.teal,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProductStorageScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Raw Materials',
            Icons.factory,
            Colors.brown,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RawMaterialsScreen()),
            ),
          ),
          _buildDashboardCard(
            context,
            'Machines',
            Icons.build,
            Colors.red,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MachinesScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}