import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'dashboard_page.dart';

class AddExpensesPage extends StatefulWidget {
  const AddExpensesPage({Key? key}) : super(key: key);

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedTag;

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    final double amount = double.tryParse(amountController.text) ?? 0.0;
    final String title = titleController.text;
    final String description = descriptionController.text;

    if (amount <= 0 || selectedTag == null || title.isEmpty || description.isEmpty) {
      // Handle validation error here
      return;
    }

    // Construct the expense data
    final expenseData = {
      'amount': amount,
      'tag': selectedTag,
      'title': title,
      'description': description,
    };

    // Navigate back to the dashboard and pass the expense data
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DashboardPage(
          expenseData: expenseData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: const Text(
          'Add Expenses',
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
            darkBackButton,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Amount',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B6A66),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text(
                  '₱',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: darkText,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter amount',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2F2C2C)),
                      ),
                    ),
                    cursorColor: const Color(0xFF2F2C2C),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
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
            MyDropdown(
              onChanged: (value) {
                setState(() {
                  selectedTag = value;
                });
              },
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
              controller: titleController,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: darkText,
              ),
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
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
              controller: descriptionController,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: darkText,
              ),
              decoration: InputDecoration(
                hintText: 'Enter description',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 2.0),
                ),
              ),
              cursorColor: const Color(0xFF2F2C2C),
              maxLines: null,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _saveExpense,
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
    );
  }
}

class MyDropdown extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const MyDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedTag;

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
            widget.onChanged?.call(value ?? '');
            setState(() {
              selectedTag = value;
            });
          },
          hint: Text(
            selectedTag ?? 'Select category',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: selectedTag != null ? Colors.black : const Color(0xFFA9A9A9),
            ),
          ),
          value: selectedTag,
        ),
      ),
    );
  }
}