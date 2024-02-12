import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/constants.dart';
import 'notification_page.dart';

class SummaryPage2 extends StatelessWidget {
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
              child: Column(
                children: [
                  StackedColumnChart(),
                ],
              ),
            ),
          ),
        ],
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
