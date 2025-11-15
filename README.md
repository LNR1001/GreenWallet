🌿 GreenWallet

A sustainable budgeting and eco-lifestyle companion app built with Flutter and Provider.
GreenWallet helps users track their spending, set smart budgets, discover eco-friendly meal suggestions, and build healthier, greener habits.

https://github.com/user-attachments/assets/7bdcc948-1f2d-4ef3-aba9-13bf421a56f2


📌 Overview

GreenWallet combines personal finance with sustainability awareness.
It encourages users to spend smarter while learning how lifestyle choices impact health and the environment.

✨ Features
💰 Smart Budget Tracking

- Set and update a monthly budget

- Add expenses with category, amount, and description

- Visual budget progress indicator on Dashboard

- Complete expense history list

🥗 Meal Suggestions & Favorites

- Scroll through eco-friendly meal ideas

- Tap a suggestion to save it to your Favorites

- Favorites appear above the suggestions for fast access

- Designed to promote sustainable and healthy eating

🌎 Eco & Health Insights (Future Feature)

- Carbon savings tracker

- Eco level progression

- Health meal scoring

🏆 Leaderboard (Future Feature)

- Compare eco scores with friends and other users

🛠 Tech Stack

- Flutter (Dart)

- Provider for state management

- Material 3 UI design

- Cross-platform support: iOS, Android, Web, Desktop

## 📁 Project Structure

```
GreenWallet/
│
├── lib/
│   ├── main.dart
│   ├── app_state.dart
│   │
│   ├── config/
│   │   ├── api_urls.dart
│   │   └── app_config.dart
│   │
│   ├── models/
│   │   ├── expense.dart
│   │   ├── meal.dart
│   │   └── user.dart
│   │
│   ├── services/
│   │   ├── api_service.dart
│   │   └── auth_service.dart
│   │
│   ├── screens/
│   │   ├── dashboard_screen.dart
│   │   │
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   │
│   │   ├── budget/
│   │   │   ├── add_expense.dart
│   │   │   ├── expense_history.dart
│   │   │   └── budget_settings.dart
│   │   │
│   │   └── meals/
│   │       └── meal_details.dart
│   │
│   ├── utils/
│   │   ├── date_utils.dart
│   │   └── currency_utils.dart
│   │
│   └── data/
│       ├── mock_expenses.json
│       └── mock_meals.json
│
├── backend/
│   ├── main.py                  # or index.js (Express)
│   │
│   ├── routes/
│   │   ├── expenses.py
│   │   ├── meals.py
│   │   └── users.py
│   │
│   ├── controllers/
│   │   ├── expense_controller.py
│   │   ├── meal_controller.py
│   │   └── user_controller.py
│   │
│   ├── models/
│   │   ├── expense_model.py
│   │   ├── meal_model.py
│   │   └── user_model.py
│   │
│   ├── services/
│   │   ├── database.py
│   │   ├── carbon_service.py
│   │   └── meal_service.py
│   │
│   ├── utils/
│   │   ├── validators.py
│   │   └── security.py
│   │
│   ├── config/
│   │   └── env.example
│   │
│   ├── tests/
│   │   └── test_expenses.py
│   │
│   ├── requirements.txt         # FastAPI
│   └── Dockerfile               # optional
│
└── README.md

```

Getting Started

1️⃣ Clone the Repository
```
git clone https://github.com/LNR1001/GreenWallet.git
```
```
cd GreenWallet
```
2️⃣ Install Dependencies

Make sure Flutter is installed:
```
flutter --version
```

Install required packages:
```
flutter pub get
```
3️⃣ Run the App

▶️ Web
```
flutter run -d chrome
```
▶️ Android
```
flutter emulators --launch <emulator_name>

flutter run
```

▶️ iOS (Mac only)
```
open -a Simulator

flutter run
```




