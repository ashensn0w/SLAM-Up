import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'package:slam_up/utils/sizes.dart';
import 'package:slam_up/utils/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FinancialContents extends StatefulWidget {
  const FinancialContents({super.key});

  @override
  State<FinancialContents> createState() => _FinancialContentsState();
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
            margin: const EdgeInsets.only(top: 20.0),
            height: 60.0,
            width: 260,
            decoration: const BoxDecoration(
                color: finContentBg, // Change the color as needed
                borderRadius: BorderRadius.all(Radius.circular(120.0))),
            child: const Align(
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
          const SizedBox(
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
              height: 100.0,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Container in Articles Tab',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: selectedTab == 'Clips',
            child: Container(
              height: 100.0, // Set the desired height
              color: Colors.black, // Change the color as needed
              child: const Center(
                child: Text(
                  'clips Tab',
                  style: TextStyle(
                    color: Colors.white, // Change the text color as needed
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: selectedTab == 'Videos',
            child: Container(
              height: 250.0,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: '2JgvVfOfoWI',
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
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
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 8.0), // Adjust padding as needed
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: navBarBg, // Change the underline color as needed
                    width: 4.0, // Change the underline width as needed
                  ),
                )
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: darkText, // Change the text color as needed
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
