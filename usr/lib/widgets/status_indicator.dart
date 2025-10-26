import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final bool isActive;
  final String activeText;
  final String inactiveText;

  const StatusIndicator({
    super.key,
    required this.isActive,
    required this.activeText,
    required this.inactiveText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(
        isActive ? activeText : inactiveText,
        style: TextStyle(
          color: isActive ? Colors.green : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}