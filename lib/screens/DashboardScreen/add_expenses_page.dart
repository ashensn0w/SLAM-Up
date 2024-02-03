import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'dashboard_page.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg, // Use your desired background color
      appBar: AppBar(
        title: const Text(
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
            darkBackButton,
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
                'Tag',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const MyDropdown(),
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

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
  //_MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color(0xFFA9A9A9), width: 2.0),
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
                style: const TextStyle(
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
                  selectedCategory != null ? Colors.black : const Color(0xFFA9A9A9),
            ),
          ),
          value: selectedCategory,
        ),
      ),
    );
  }
}
