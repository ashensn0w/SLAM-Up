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

// import 'package:flutter/material.dart';
// import 'screens/profile_page.dart'; //palitan nyo to depende sa page na ginagawa nyo
//
// void main() {
//   runApp(const SlamUp());
// }
//
// class SlamUp extends StatelessWidget {
//   const SlamUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfilePage(
//         fullname: "Name",
//         email: "example@gmail.com",
//         birthdate: "2024-02-17",
//         sex: 'Sex',
//       ), //eto rin palitan nyo depende sa pangalan ng class nung page nyo
//     );
//   }
// }
