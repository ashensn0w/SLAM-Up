import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../utils/constants.dart';
import 'notification_page.dart';

class SummaryPage extends StatelessWidget {
  Map<String, double> dataMap = {
    "Transportation": 5000,
    "Food": 3500,
    "Bills": 7000,
    // Add more data if needed
  };

  @override
  Widget build(BuildContext context) {
    double totalExpenses = dataMap.values.reduce((value, element) => value + element);
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
                  child: Column(
                    children: [
                      Expenses(),
                      SizedBox(height: 40),
                      Text(
                        'Total Expenses: ${totalExpenses.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width / 1.2,
                child: Center(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 16,
                        chartRadius: MediaQuery.of(context).size.width / 2.0,
                        colorList: [
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                        ],
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 80,
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
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            // Navigate to other screens
                            // Use Navigator.push or Navigator.pushReplacement based on your requirement
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
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
                                  fontSize: 16.0,
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
}

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 270,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromRGBO(164, 199, 201, 1.0),
      ),
      child: Center(
        child: Text(
          'Monthly Expenses',
          style: TextStyle(
            color: Color.fromRGBO(47, 44, 44, 1.0),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
