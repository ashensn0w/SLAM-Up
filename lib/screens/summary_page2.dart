import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/constants.dart';
import 'notification_page.dart';
import 'summary_page.dart';
import 'summary_page3.dart';
import 'package:slam_up/screens/DashboardScreen/dashboard_page.dart';
import 'profile_page.dart';


class SummaryPage2 extends StatefulWidget {
  @override
  _SummaryPage2State createState() => _SummaryPage2State();
}

class _SummaryPage2State extends State<SummaryPage2> {
  int _currentPageIndex = 1; // Set initial index to 1 for SummaryPage2

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                      context, "Monthly\nExpenses", SummaryPage(), _currentPageIndex == 0),
                  _buildButton(
                      context, "Future Forecast\nSpending", SummaryPage2(), _currentPageIndex == 1),
                  _buildButton(
                      context, "Budget\nAllocation", SummaryPage3(), _currentPageIndex == 2),
                ],
              ),
            ),
          ),
          SizedBox(height: 2),
          StackedColumnChart(),
        ],
      ),
        bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination,
      bool isActive) {
    Color backgroundColor = isActive ? Colors.white : Color.fromRGBO(164, 199, 201, 1.0);
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

class StackedColumnChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(16),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Monthly Expenses'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          StackedColumnSeries<ExpensesData, String>(
            dataSource: [
              ExpensesData(month: 'November', food: 8000, transpo: 9000, bills: 4000, school: 3000),
              ExpensesData(month: 'December', food: 7500, transpo: 12000, bills: 7500, school: 5500),
              ExpensesData(month: 'January', food: 5000, transpo: 10000, bills: 5000, school: 7000),
              ExpensesData(month: 'February', food: 4500, transpo: 10000, bills: 7000, school: 5000),
            ],
            xValueMapper: (ExpensesData expenses, _) => expenses.month,
            yValueMapper: (ExpensesData expenses, _) => expenses.food,
            name: 'Food',
          ),
          StackedColumnSeries<ExpensesData, String>(
            dataSource: [
              ExpensesData(month: 'November', food: 8000, transpo: 9000, bills: 4000, school: 3000),
              ExpensesData(month: 'December', food: 7500, transpo: 12000, bills: 7500, school: 5500),
              ExpensesData(month: 'January', food: 5000, transpo: 10000, bills: 5000, school: 7000),
              ExpensesData(month: 'February', food: 4500, transpo: 10000, bills: 7000, school: 5000),
            ],
            xValueMapper: (ExpensesData expenses, _) => expenses.month,
            yValueMapper: (ExpensesData expenses, _) => expenses.transpo,
            name: 'Transportation',
          ),
          StackedColumnSeries<ExpensesData, String>(
            dataSource: [
              ExpensesData(month: 'November', food: 8000, transpo: 9000, bills: 4000, school: 3000),
              ExpensesData(month: 'December', food: 7500, transpo: 12000, bills: 7500, school: 5500),
              ExpensesData(month: 'January', food: 5000, transpo: 10000, bills: 5000, school: 7000),
              ExpensesData(month: 'February', food: 4500, transpo: 10000, bills: 7000, school: 5000),
            ],
            xValueMapper: (ExpensesData expenses, _) => expenses.month,
            yValueMapper: (ExpensesData expenses, _) => expenses.bills,
            name: 'Bills',
          ),
          StackedColumnSeries<ExpensesData, String>(
            dataSource: [
              ExpensesData(month: 'November', food: 8000, transpo: 9000, bills: 4000, school: 3000),
              ExpensesData(month: 'December', food: 7500, transpo: 12000, bills: 7500, school: 5500),
              ExpensesData(month: 'January', food: 5000, transpo: 10000, bills: 5000, school: 7000),
              ExpensesData(month: 'February', food: 4500, transpo: 10000, bills: 7000, school: 5000),
            ],
            xValueMapper: (ExpensesData expenses, _) => expenses.month,
            yValueMapper: (ExpensesData expenses, _) => expenses.school,
            name: 'School',
          ),
        ],
      ),
    );
  }
}

class ExpensesData {
  ExpensesData({required this.month, required this.food, required this.transpo, required this.bills, required this.school});

  final String month;
  final double food;
  final double transpo;
  final double bills;
  final double school;
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
