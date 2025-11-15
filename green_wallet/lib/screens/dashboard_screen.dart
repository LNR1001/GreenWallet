import 'package:flutter/material.dart';
import 'package:green_wallet/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:green_wallet/app_state.dart';
import 'budget/add_expense.dart';
import 'budget/expense_history.dart';
import 'budget/budget_settings.dart';

final List<Map<String, String>> mealSuggestions = [
  {"name": "Veggie Stir Fry", "desc": "Uses your leftover veggies"},
  {"name": "High Protein Bowl", "desc": "Great for energy"},
  {"name": "Avocado Toast", "desc": "Healthy fats"},
  {"name": "Sweet Potato Curry", "desc": "Low carbon footprint"},
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);

    final budget = appState.monthlyBudget;
    final spent = appState.totalSpent;
    final progress = (budget == 0) ? 0 : spent / budget;

    final meals = appState.healthyMeals;     // (We'll add later)
    final carbon = appState.carbonSaved;     // (We'll add later)

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F6),
      appBar: AppBar(
      backgroundColor: const Color(0xFF1B5E20),
      elevation: 0,
      title: Row(
        children: const [
          Icon(Icons.wallet, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "GreenWallet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
        ),
      ],
    ),


      // ------------------ BODY -------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ YOUR GREEN STATS ------------------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Your Green Stats",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(
                        icon: Icons.monetization_on,
                        label: "Monthly Budget",
                        value: "\$${spent.toStringAsFixed(0)}/\$${budget.toStringAsFixed(0)}",
                      ),
                      _StatItem(
                        icon: Icons.energy_savings_leaf, // NOT real icon, Flutter replaces with eco icon below
                        label: "Healthy Meals",
                        value: "12/20",
                        iconOverride: Icons.eco,
                      ),
                      _StatItem(
                        icon: Icons.public,
                        label: "Carbon Saved",
                        value: "3.2kg",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ------------------ BUDGET TRACKING ------------------
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Budget Tracking",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.attach_money, color: Colors.green),
                    ],
                  ),

                  const SizedBox(height: 12),

                  LinearProgressIndicator(
                  value: progress.clamp(0, 1).toDouble(),
                  color: Colors.green,
                  backgroundColor: Colors.grey.shade300,
                  minHeight: 8,
                ),
                  const SizedBox(height: 8),

                  Text(
                    "You've spent \$${spent.toStringAsFixed(0)} of your \$${budget.toStringAsFixed(0)} budget this month",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            if (appState.favoriteMeals.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Favorite Meals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // List of favorites
                    Column(
                      children: appState.favoriteMeals.map((meal) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(meal,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16)),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.red),
                                onPressed: () {
                                  appState.removeFavoriteMeal(meal);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            // ------------------ MEAL SUGGESTIONS ------------------
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Meal Suggestions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ⭐ Suggestions list
                  Column(
                    children: mealSuggestions.map((meal) {
                      return InkWell(
                        onTap: () {
                          appState.addFavoriteMeal(meal["name"]!);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(meal["name"]!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(meal["desc"]!,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black54)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.add_circle,
                                  color: Colors.green, size: 28),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

      // ------------------ NAV BAR -------------------
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Dashboard index
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            switch (index) {

              // HOME
              case 0:
                // Already on dashboard
                break;

              // EXPENSE HISTORY
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExpensesHistoryScreen(
                      expenses: Provider.of<AppState>(context, listen: false).expenses,
                    ),
                  ),
                );
                break;

              // ADD EXPENSE
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
                );
                break;

              // BUDGET SETTINGS
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BudgetSettingsScreen()),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Add"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Budget"),
          ],
        ),

    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final IconData? iconOverride;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    this.iconOverride,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final IconData iconToUse = iconOverride ?? icon;

    return Column(
      children: [
        Icon(iconToUse, size: 30, color: Colors.green),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ],
    );
  }
}
