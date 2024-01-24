import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: darkText,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // Handle back button press as needed
            Navigator.pop(context);
          },
          child: Image.asset(
            'lib/assets/images/GlobalIcons/dark_back_button.png', // Your custom icon path
            color: Color(0xFF2F2C2C), // Set the icon color
          ),
        ),
      ),
      body: Center(
        child: Text('This is the new screen.'),
      ),
    );
  }
}
