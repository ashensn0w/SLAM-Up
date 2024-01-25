import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'notification_page.dart';
//import 'package:file_picker/file_picker.dart';

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
              TransactionsContainer(),
            ],
          ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}

class ViewTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: Text(
          'View All',
          style: TextStyle(
            color: darkText,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'lib/assets/images/GlobalIcons/dark_back_button.png',
          ),
        ),
      ),
      body: Center(
        child: Text('This is the new screen.'),
      ),
    );
  }
}

class AddExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg, // Use your desired background color
      appBar: AppBar(
        title: Text(
          'Add Expenses',
          style: TextStyle(
            color: darkText, // Use your desired text color
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'lib/assets/images/GlobalIcons/dark_back_button.png',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10), // Adjust the spacing as needed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B6A66),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        '₱', // Philippine Peso symbol
                        style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: darkText,
                        ),
                      ),
                      SizedBox(width: 10), // Adjust spacing as needed
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: darkText,
                            // Add other style properties as needed
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              // Add other hint style properties as needed
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2F2C2C)),
                            ),
                          ),
                          cursorColor: Color(0xFF2F2C2C),
                        ),
                      ),
                      SizedBox(width: 10), // Adjust spacing as needed
                      Text(
                        'PHP',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B6A66),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Tag',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              MyDropdown(),
              SizedBox(height: 20),
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: Color(0xFF2F2C2C),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: Color(0xFF2F2C2C),
                maxLines: null,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
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
                    'Save',
                    style: TextStyle(
                      color: lightText,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              /*Center(
                child: ElevatedButton(
                  onPressed: attachFile,
                  child: Text(
                    'Attach a File',
                    style: TextStyle(
                      color: darkText,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD5D0CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 3,
                      vertical: 25.0,
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0xFFA9A9A9), width: 2.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: <String>[
            'Housing',
            'Transportation',
            'Food and Grocery',
            'Health and Wellness',
            'Debt Payment',
            'Entertainment',
            'Clothing and Personal Care',
            'Education',
            'Savings and Investments',
            'Utilities',
            'Insurance',
            'Gifts and Donations',
            'Travel and Vacation',
            'Miscellaneous'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black, // Set your desired text color
                ),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedCategory = value;
            });
            // Handle the selected value
          },
          hint: Text(
            selectedCategory ?? 'Select category',
            style: TextStyle(
              fontFamily: 'Poppins',
              color:
                  selectedCategory != null ? Colors.black : Color(0xFFA9A9A9),
            ),
          ),
          value: selectedCategory,
        ),
      ),
    );
  }
}

class AddMoneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg, // Use your desired background color
      appBar: AppBar(
        title: Text(
          'Add Money',
          style: TextStyle(
            color: darkText, // Use your desired text color
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'lib/assets/images/GlobalIcons/dark_back_button.png',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10), // Adjust the spacing as needed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B6A66),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        '₱', // Philippine Peso symbol
                        style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: darkText,
                        ),
                      ),
                      SizedBox(width: 10), // Adjust spacing as needed
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: darkText,
                            // Add other style properties as needed
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              // Add other hint style properties as needed
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2F2C2C)),
                            ),
                          ),
                          cursorColor: Color(0xFF2F2C2C),
                        ),
                      ),
                      SizedBox(width: 10), // Adjust spacing as needed
                      Text(
                        'PHP',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B6A66),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: Color(0xFF2F2C2C),
              ),
              SizedBox(height: 20),
              Text(
                'Spending Limit',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter spending limit',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: Color(0xFF2F2C2C),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: Color(0xFF2F2C2C),
                maxLines: null,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
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
                    'Save',
                    style: TextStyle(
                      color: lightText,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              /*Center(
                child: ElevatedButton(
                  onPressed: attachFile,
                  child: Text(
                    'Attach a File',
                    style: TextStyle(
                      color: darkText,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD5D0CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 3,
                      vertical: 25.0,
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionsContainer extends StatelessWidget {
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
                    fontFamily: 'Poppins',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
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
                      primary: Color(0xFF39524F),
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
