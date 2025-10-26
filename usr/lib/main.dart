import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const FactoryManagementApp());
}

class FactoryManagementApp extends StatelessWidget {
  const FactoryManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 4,
          margin: const EdgeInsets.all(8),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}