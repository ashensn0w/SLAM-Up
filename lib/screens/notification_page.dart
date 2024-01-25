import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
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
              darkBackButton,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Unread'),
              Tab(text: 'All'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFAF7F3), // Set container color to "D9D9D9"
            borderRadius: BorderRadius.circular(15.0), // Set border radius
          ),
          margin: EdgeInsets.all(20.0), // Adjust margin as needed
          child: TabBarView(
            children: [
              // Unread tab content
              Center(
                child: Text('Unread Notifications'),
              ),
              // All tab content
              Center(
                child: Text('All Notifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
