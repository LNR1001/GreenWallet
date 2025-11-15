import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double monthlyBudget = 400;
  double totalSpent = 320;

  List<Map<String, dynamic>> expenses = [];

  // Add a new expense
  void addExpense(Map<String, dynamic> expense) {
    expenses.add(expense);
    totalSpent += expense['amount'];
    notifyListeners(); // <- updates dashboard automatically
  }

  // Update monthly budget
  void updateBudget(double newBudget) {
    monthlyBudget = newBudget;
    notifyListeners();
  }

  int healthyMeals = 12;      // sample placeholder
  double carbonSaved = 3.2;   // sample placeholder

  // ⭐ NEW: favorite meals
  List<String> favoriteMeals = [];

  // ⭐ Add to favorites
  void addFavoriteMeal(String mealName) {
    if (!favoriteMeals.contains(mealName)) {
      favoriteMeals.add(mealName);
      notifyListeners();
    }
  }

  // ⭐ Remove from favorites (optional)
  void removeFavoriteMeal(String mealName) {
    favoriteMeals.remove(mealName);
    notifyListeners();
  }

}
