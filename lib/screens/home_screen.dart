import 'package:flutter/material.dart';
import 'budget/add_expense.dart';
import 'profile_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = [
      {'title': 'Groceries', 'amount': 42.75, 'category': 'Food'},
      {'title': 'Bus Ticket', 'amount': 3.25, 'category': 'Transport'},
      {'title': 'Coffee', 'amount': 5.00, 'category': 'Leisure'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Green Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Recent Expenses', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            ...expenses.map((e) => ExpenseCard(
                  title: e['title'] as String,
                  amount: e['amount'] as double,
                  category: e['category'] as String,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        icon: const Icon(Icons.add),
        label: const Text("Add Expense"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
