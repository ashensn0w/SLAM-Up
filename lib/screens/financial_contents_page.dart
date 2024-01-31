import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'package:slam_up/utils/sizes.dart';
import 'package:slam_up/utils/text.dart';

class FinancialContents extends StatefulWidget {
  @override
  _FinancialContentsState createState() => _FinancialContentsState();
}

class _FinancialContentsState extends State<FinancialContents> {
  String selectedTab = 'Articles';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 60.0,
            width: 260,
            decoration: BoxDecoration(
                color: finContentBg, // Change the color as needed
                borderRadius: BorderRadius.all(Radius.circular(120.0))),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Financial Content',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText, // Change the text color as needed
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabText(
                text: 'Articles',
                onTap: () => handleTabClick('Articles'),
                isSelected: selectedTab == 'Articles',
              ),
              TabText(
                text: 'Clips',
                onTap: () => handleTabClick('Clips'),
                isSelected: selectedTab == 'Clips',
              ),
              TabText(
                text: 'Videos',
                onTap: () => handleTabClick('Videos'),
                isSelected: selectedTab == 'Videos',
              ),
            ],
          ),
          Visibility(
            visible: selectedTab == 'Articles',
            child: Container(
              height: 100.0, // Set the desired height
              color: Colors.green, // Change the color as needed
              child: Center(
                child: Text(
                  'Container in Articles Tab',
                  style: TextStyle(
                    color: Colors.white, // Change the text color as needed
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                // Your other content goes here
                ),
          ),
        ],
      ),
    );
  }

  void handleTabClick(String tabName) {
    // Handle the tab click based on the tabName
    setState(() {
      selectedTab = tabName;
    });
  }
}

class TabText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const TabText({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: darkText, // Change the text color as needed
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
