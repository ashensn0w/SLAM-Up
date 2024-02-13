import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:slam_up/screens/notification_page.dart';
import '../screens/DashboardScreen/dashboard_page.dart';
import '../screens/summary_page.dart';
import '../screens/profile_page.dart';

class FinancialContents extends StatefulWidget {
  const FinancialContents({super.key});

  @override
  State<FinancialContents> createState() => _FinancialContentsState();
}

class _FinancialContentsState extends State<FinancialContents> {
  String selectedTab = 'Articles';

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = [
      YoutubePlayerController(
        initialVideoId: 'sVKQn2I4HDM',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: 'Lh-R5WrFd4E',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: 'xEPHsUtLFDA',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: 'oBi5HkqmAAQ',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: 'tCWD__q3kgs',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      body: Column(
        children: [
          AppBar(
            title: const Text(
              'Financial  Content',
              style: TextStyle(
                color: darkText,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Image.asset(
                  notifButton,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()),
                  );
                },
              ),
            ],
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
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: selectedTab == 'Articles',
            child: Container(
              height: 100.0,
              color: navBarBg,
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
              height: 100.0,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'clips Tab',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: selectedTab == 'Videos',
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _controllers.asMap().entries.map((entry) {
                      final index = entry.key;
                      final controller = entry.value;
                      return Column(
                        children: [
                          SizedBox(
                            height: 250.0,
                            child: YoutubePlayer(
                              controller: controller,
                              showVideoProgressIndicator: true,
                            ),
                          ),
                          // Add a space between videos except for the last one
                          if (index != _controllers.length - 1)
                            const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleTabClick(String tabName) {
    // Handle the tab click based on the tabName
    setState(() {
      selectedTab = tabName;
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: navBarBg,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(
              dashboardUnselected,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              summaryUnselected,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              financialContentsSelected,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FinancialContents()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              profileUnselected,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(fullname: "Name", email: "example@gmail.com", birthdate: "2024-02-17", sex: 'Sex',)),
              );
            },
          ),
        ],
      ),
    );
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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
            bottom: BorderSide(
              color: navBarBg,
              width: 4.0,
            ),
          )
              : null,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: darkText,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}