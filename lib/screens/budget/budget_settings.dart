import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:green_wallet/app_state.dart';

class BudgetSettingsScreen extends StatefulWidget {
  const BudgetSettingsScreen({super.key});

  @override
  State<BudgetSettingsScreen> createState() => _BudgetSettingsScreenState();
}

class _BudgetSettingsScreenState extends State<BudgetSettingsScreen> {
  double monthlyBudget = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Settings"),
        backgroundColor: const Color(0xFF1B5E20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Monthly Budget",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 14),

            // Budget Slider
            Slider(
              activeColor: Colors.green,
              min: 100,
              max: 2000,
              divisions: 38,
              label: "\$${monthlyBudget.toStringAsFixed(0)}",
              value: monthlyBudget,
              onChanged: (value) => setState(() => monthlyBudget = value),
            ),

            const SizedBox(height: 10),

            Text(
              "Current Budget: \$${monthlyBudget.toStringAsFixed(0)}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            // Save
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Provider.of<AppState>(context, listen: false)
                  .updateBudget(monthlyBudget);

                Navigator.pop(context);
              },
              child: const Text(
                "Save Budget",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
