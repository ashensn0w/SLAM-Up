import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine whether there are notifications available or not
    bool hasNotifications = true; // Change this value based on your logic
    return hasNotifications
        //? NoNotificationsScreen() // Display notification list screen if there are notifications
        ? NotificationListScreen()
        //: NotificationListScreen(); // Display no notifications screen if there are no notifications
        : NoNotificationsScreen();
  }
}

class NoNotificationsScreen extends StatelessWidget {
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
            Navigator.pop(context);
          },
          child: Image.asset(
            darkBackButton,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  color: seconDarkBg,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: primLightBg,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'There are Currently No Notifications to Display.',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: darkText, // Set the text color as needed
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationListScreen extends StatelessWidget {
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
            Navigator.pop(context);
          },
          child: Image.asset(
            darkBackButton,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  color: seconDarkBg,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: primLightBg,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(20.0),
                      children: [
                        // Example notification message widgets
                        NotificationMessageWidget(
                          message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        ),
                        NotificationMessageWidget(
                          message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        ),
                        NotificationMessageWidget(
                          message:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for a single notification message
class NotificationMessageWidget extends StatelessWidget {
  final String message;

  const NotificationMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 8.0), // Adjust padding for position
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10), // Add some space between the icon and the divider
                  Image.asset(
                    notifButton,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400, // Regular font weight
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify, // Justify the text
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2, // Adjust thickness as needed
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
