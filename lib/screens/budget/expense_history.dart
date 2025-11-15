import 'package:flutter/material.dart';

class ExpensesHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;

  const ExpensesHistoryScreen({super.key, required this.expenses});

 @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Expenses History"),
          backgroundColor: const Color(0xFF1B5E20),
        ),
        body: const Center(
          child: Text(
            "No expenses yet.\nAdd some from the dashboard!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses History"),
        backgroundColor: const Color(0xFF1B5E20),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final item = expenses[index];

          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              title: Text(item['title']),
              subtitle: Text(item['category']),
              trailing: Text(
                "\$${item['amount'].toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
