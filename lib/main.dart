import 'package:flutter/material.dart';
// import 'package:slam_up/screens/welcome_page.dart';
// import 'screens/DashboardScreen/dashboard_page.dart';
//import './screens/financial_contents_page.dart';
import './screens/welcome_page.dart';

void main() {
  runApp(const SlamUp());
}

class SlamUp extends StatelessWidget {
  const SlamUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SLAMUPLogo(),
    );
  }
}
