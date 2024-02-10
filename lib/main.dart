import 'package:flutter/material.dart';
import 'screens/DashboardScreen/dashboard_page.dart';

void main() {
  runApp(const SlamUp());
}

class SlamUp extends StatelessWidget {
  const SlamUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
