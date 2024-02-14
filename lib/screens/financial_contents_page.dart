import 'package:flutter/material.dart';
import 'package:slam_up/utils/sizes.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:slam_up/screens/notification_page.dart';
import '../screens/DashboardScreen/dashboard_page.dart';
import '../screens/summary_page.dart';
import '../screens/profile_page.dart';
import 'package:slam_up/utils/constants.dart';

class FinancialContents extends StatefulWidget {
  const FinancialContents({super.key});

  @override
  State<FinancialContents> createState() => _FinancialContentsState();
}

class _FinancialContentsState extends State<FinancialContents> {
  String selectedTab = 'Articles';
  final sampleImage1 =
      'https://usalg.org/wp-content/uploads/2021/01/Budgeting-1.jpg';
  final sampleImage2 =
      'https://www.debt.org/wp-content/uploads/2020/06/shutterstock_1357509185-1.jpg';
  final sampleImage3 =
      'https://www.honeybook.com/blog/wp-content/uploads/2022/02/tracking-expenses-feature.jpg';
  final sampleImage4 =
      'https://www.mimeo.com/wp-content/uploads/2022/03/Check-out-how-an-expense-tracking-app-simplifies-reimbursements-1.jpg';

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
                icon: Image.asset(
                  notifButton,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()),
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
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: contentsBg,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            CircleAvatar(
                              backgroundImage: NetworkImage(sampleImage1),
                              radius: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(
                                    'https://www.ramseysolutions.com/budgeting/the-truth-about-budgeting'), // Replace with your desired URL
                                builder: (context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: const Text(
                                    'Budggeting Tips',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: lightText,
                                      fontSize: fontSizes.fontsizeSm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: contentsBg,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            CircleAvatar(
                              backgroundImage: NetworkImage(sampleImage2),
                              radius: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(
                                    'https://www.freshbooks.com/hub/accounting/expense-tracking'), // Replace with your desired URL
                                builder: (context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: const Text(
                                    'Expense Tracking',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: lightText,
                                      fontSize: fontSizes.fontsizeSm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: contentsBg,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            CircleAvatar(
                              backgroundImage: NetworkImage(sampleImage3),
                              radius: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(
                                    'https://bettermoneyhabits.bankofamerica.com/en/saving-budgeting/ways-to-save-money'), // Replace with your desired URL
                                builder: (context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: const Text(
                                    'Ways to Save Money',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: lightText,
                                      fontSize: fontSizes.fontsizeSm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: contentsBg,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            CircleAvatar(
                              backgroundImage: NetworkImage(sampleImage4),
                              radius: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(
                                    'https://www.myhubble.money/blog/on-spending-money-wisely'), // Replace with your desired URL
                                builder: (context, followLink) => TextButton(
                                  onPressed: followLink,
                                  child: const Text(
                                    'Spend Your Money Wisely',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: lightText,
                                      fontSize: fontSizes.fontsizeSm,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
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
                MaterialPageRoute(builder: (context) => const SummaryPage()),
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
                MaterialPageRoute(
                    builder: (context) => const FinancialContents()),
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
                MaterialPageRoute(
                    builder: (context) => const ProfilePage(
                          fullname: "Name",
                          email: "example@gmail.com",
                          birthdate: "2024-02-17",
                          sex: 'Sex',
                        )),
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
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

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
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
