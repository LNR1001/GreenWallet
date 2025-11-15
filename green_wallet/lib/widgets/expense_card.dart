import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final double amount;
  final String category;

  const ExpenseCard({
    super.key,
    required this.title,
    required this.amount,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(category),
        trailing: Text('\$${amount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16, color: Colors.green)),
      ),
    );
  }
}
