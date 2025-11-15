import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';


class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  double amount = 0.0;
  String category = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
        backgroundColor: const Color(0xFF1B5E20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Expense Title
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Expense Title",
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => title = val ?? '',
              ),

              const SizedBox(height: 16),

              // Amount
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (val) => amount = double.tryParse(val ?? '0') ?? 0.0,
              ),

              const SizedBox(height: 16),

              // Category Dropdown
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Category",
                ),
                items: const [
                  DropdownMenuItem(value: "Food", child: Text("Food")),
                  DropdownMenuItem(value: "Transport", child: Text("Transport")),
                  DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                  DropdownMenuItem(value: "Bills", child: Text("Bills")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (value) => setState(() => category = value!),
              ),

              const SizedBox(height: 24),

              // Save button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  _formKey.currentState?.save();

                  // ADD TO PROVIDER (THE IMPORTANT PART)
                  Provider.of<AppState>(context, listen: false).addExpense({
                    'title': title,
                    'amount': amount,
                    'category': category,
                  });

                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Expense",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
