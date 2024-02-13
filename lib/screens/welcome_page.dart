import 'package:flutter/material.dart';
import 'package:slam_up/screens/signin_page.dart';
import 'dart:async';
import '../utils/constants.dart';

class SLAMUPLogo extends StatefulWidget {
  const SLAMUPLogo({super.key});

  @override
  State<SLAMUPLogo> createState() => _SLAMUPLogoState();
}

class _SLAMUPLogoState extends State<SLAMUPLogo> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds and then navigate to the signin page
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SigninPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(slamupLogo),
      ),
    );
  }
}
