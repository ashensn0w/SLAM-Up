import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import '../DashboardScreen/add_money_page.dart';
import '../DashboardScreen/add_expenses_page.dart';
import '../DashboardScreen/view_transactions_page.dart';
import '../notification_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: Text(
          'Dashboard',
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
                height: MediaQuery.of(context).size.height / 4,
                child: Center(
                  child: MoneyCardWidget(amount: 69000.0),
                ),
              ),
              SizedBox(height: 20.0),
              TransactionsWidget(),
              SizedBox(height: 10.0),
              TransactionListWidget(), // Add spacing between existing TransactionsContainer and new transactions list
            ],
          ),
          AddMoneyButton(),
        ],
      ),
    );
  }
}

class MoneyCardWidget extends StatelessWidget {
  final double amount;

  MoneyCardWidget({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: dashboardActiveCard,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Physical Money',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  '₱ $amount',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddMoneyPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: seconDarkBg,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20.0),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFD5D0CA),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddMoneyButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70.0,
      right: 20.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpensesPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: seconDarkBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
        ),
        child: Text(
          '+ Add Expenses',
          style: TextStyle(
            color: lightText,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class TransactionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  color: darkText,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewTransactionsPage()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: viewAllButton,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Today',
            style: TextStyle(
              color: darkText,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          TransactionListItem(
            title: 'Movie',
            description:
                'rororrororrororrororrororrororrororrororrororrororrororrororrororroror',
            amount: -700,
            icon: entertainmentIcon,
          ),
          TransactionListItem(
            title: 'Racket',
            description: 'For sports',
            amount: -1500,
            icon: healthIcon,
          ),
          TransactionListItem(
            title: 'Food',
            description: 'Groceries',
            amount: -2000,
            icon: foodIcon,
          ),
          // Add more TransactionListItem widgets as needed
        ],
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final String title;
  final String description;
  final double amount;
  final String icon;

  const TransactionListItem({
    Key? key,
    required this.title,
    required this.description,
    required this.amount,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFD5D0CA),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                width: 35.0,
                height: 35.0,
                // You may need to adjust the image asset path based on your project structure
              ),
              SizedBox(width: 8.0), // Add some spacing between icon and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Money Deducted: $amount',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Description: $description',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
