import 'package:flutter/material.dart';
import 'screens/dashboard_page.dart'; //palitan nyo to depende sa page na ginagawa nyo

void main() {
  runApp(SlamUp());
}

class SlamUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(), //eto rin palitan nyo depende sa pangalan ng class nung page nyo
    );
  }
}
