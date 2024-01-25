import 'package:flutter/material.dart';

class Category {
  final String name;
  final int value;

  Category({required this.name, required this.value});
}

class SummaryPage extends StatelessWidget {
  List<Category> categories = [
    Category(name: 'Bills', value: 10000),
    Category(name: 'Leisure', value: 5000),
    Category(name: 'Transportation', value: 5000),
    Category(name: 'Food', value: 5000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Summary',
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
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
              // You can navigate to the notification page or show a notification
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 40.0,
            top: 5.0,
            child: Expenses(),
          ),
          Positioned(
            left: 0,
            top: 280.0,
            child: Container(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 30.0,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Color.fromRGBO(87, 111, 115, 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories:',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 330.0,
            child: Container(
              padding: EdgeInsets.only(
                top: 5.0,
                left: 35.0,
              ),
              width: MediaQuery.of(context).size.width,
              // Increase the height to a value that accommodates all categories
              height: 300.0, // Adjust height as needed
              color: Color.fromRGBO(87, 111, 115, 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories.map((category) {
                  return Text(
                    '${category.name}: ${category.value}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
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
