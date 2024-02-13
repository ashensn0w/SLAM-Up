import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../utils/constants.dart';
import 'notification_page.dart';
import 'summary_page2.dart';
import 'summary_page3.dart';
import 'package:slam_up/screens/DashboardScreen/dashboard_page.dart';
import 'profile_page.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Map<String, double> dataMap = {
    "Transportation": 5000,
    "Food": 3500,
    "Bills": 7000,
    // Add more data if needed
  };

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double totalExpenses = dataMap.values.reduce((value, element) =>
    value + element);
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: Text(
          'Summary',
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
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(context, "Monthly\nExpenses", SummaryPage(),
                          _currentPageIndex == 0),
                      _buildButton(
                          context, "Future Forecast\nSpending", SummaryPage2(),
                          _currentPageIndex == 1),
                      _buildButton(
                          context, "Budget\nAllocation", SummaryPage3(),
                          _currentPageIndex == 2),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Total Expenses: ${totalExpenses.toStringAsFixed(2)}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  fontSize: 18.0,
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child: Center(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 2000),
                        chartLegendSpacing: 16,
                        chartRadius: MediaQuery
                            .of(context)
                            .size
                            .width / 2.5,
                        colorList: [
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                        ],
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 50,
                        centerText: "Expenses",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: false,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: true,
                          decimalPlaces: 1,
                          chartValueBackgroundColor: Colors.transparent,
                          chartValueStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: dataMap.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getColorForCategory(entry.key),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${entry.key}: ${entry.value}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
        bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }

  Color getColorForCategory(String category) {
    switch (category) {
      case "Transportation":
        return Colors.blue;
      case "Food":
        return Colors.green;
      case "Bills":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildButton(BuildContext context, String text, Widget destination,
      bool isActive) {
    Color backgroundColor = isActive ?Colors.white : Color.fromRGBO(164, 199, 201, 1.0);
    Color textColor = isActive ? Color.fromRGBO(47, 44, 44, 1.0) : Color.fromRGBO(47, 44, 44, 1.0);

    return ElevatedButton(
      onPressed: isActive ? null : () {
        setState(() {
          if (destination is SummaryPage) {
            _currentPageIndex = 0;
          } else if (destination is SummaryPage2) {
            _currentPageIndex = 1;
          } else if (destination is SummaryPage3) {
            _currentPageIndex = 2;
          }
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.0),
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Container(
        width: 120,
        height: 60,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
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
              summarySelected,
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
              financialContentsUnselected,
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
              profileUnselected,
            ),
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
