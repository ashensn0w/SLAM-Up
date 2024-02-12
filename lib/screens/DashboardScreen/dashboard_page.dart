import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import '../DashboardScreen/add_money_page.dart';
import '../DashboardScreen/add_expenses_page.dart';
import '../DashboardScreen/view_transactions_page.dart';
import '../notification_page.dart';
import '../summary_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: const Text(
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: const Center(
                  child: MoneyCard(amount: 69000.0),
                ),
              ),
              const SizedBox(height: 20.0),
              const ViewAllButton(),
              const SizedBox(height: 10.0),
              const TransactionList(),
            ],
          ),
          const AddExpensesButton(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
              dashboardSelected,
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
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}


class MoneyCard extends StatelessWidget {
  final double amount;

  const MoneyCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: dashboardActiveCard,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Physical Money',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  '₱ $amount',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddMoneyPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: seconDarkBg,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20.0),
                    ),
                    child: const Icon(
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

class AddExpensesButton extends StatelessWidget {
  const AddExpensesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 20.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpensesPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: seconDarkBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20.0,
          ),
        ),
        child: const Text(
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

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
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
                        builder: (context) => const ViewTransactionsPage()),
                  );
                },
                child: const Text(
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
          const SizedBox(height: 8.0),
          const Text(
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

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          TransactionListWidget(
            title: 'Movie',
            description:
            'rororrororrororror',
            amount: 700,
            icon: entertainmentIcon,
          ),
          TransactionListWidget(
            title: 'Racket',
            description: 'For sports',
            amount: 1500,
            icon: healthIcon,
          ),
          TransactionListWidget(
            title: 'Food',
            description: 'Groceries',
            amount: 2000,
            icon: foodIcon,
          ),
        ],
      ),
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  final String title;
  final String description;
  final double amount;
  final String icon;

  const TransactionListWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.amount,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD5D0CA),
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
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
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
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Description: $description',
            style: const TextStyle(
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