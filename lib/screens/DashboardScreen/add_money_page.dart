import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'dashboard_page.dart';

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg, // Use your desired background color
      appBar: AppBar(
        title: const Text(
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
              const SizedBox(height: 10), // Adjust the spacing as needed
              const Column(
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
                          fontFamily: 'Roboto',
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
              const SizedBox(height: 20),
              const Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: const Color(0xFF2F2C2C),
              ),
              const SizedBox(height: 20),
              const Text(
                'Spending Limit',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter spending limit',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: const Color(0xFF2F2C2C),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: darkText,
                  // Add other style properties as needed
                ),
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    // Add other hint style properties as needed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                  ),
                ),
                cursorColor: const Color(0xFF2F2C2C),
                maxLines: null,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
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
            ],
          ),
        ),
      ),
    );
  }
}
