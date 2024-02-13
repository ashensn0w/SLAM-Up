import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:slam_up/screens/notification_page.dart';

class FinancialContents extends StatefulWidget {
  const FinancialContents({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            title: const Text(
              'Financial Content',
              style: TextStyle(
                color: Colors.black,
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
                icon: const Icon(Icons.notifications),
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
              height: 100.0,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Clips Tab',
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
    setState(() {
      selectedTab = tabName;
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
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
            icon: const Icon(Icons.dashboard),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.summary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.money),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinancialContents()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
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
                    color: Colors.blue,
                    width: 4.0,
                  ),
                )
              : null,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
