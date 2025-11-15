import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:green_wallet/app_state.dart';
import 'package:green_wallet/screens/home_screen.dart';
import 'screens/dashboard_screen.dart';
import 'utils/theme.dart';

void main() {
   runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const GreenWalletApp(),
    ),
  );
}

class GreenWalletApp extends StatelessWidget {
  const GreenWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Wallet',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const DashboardScreen(),
    );
  }
}
