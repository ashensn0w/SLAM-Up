import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../utils/constants.dart';
import 'notification_page.dart';
import 'package:flutter/services.dart';
import 'summary_page.dart';
import 'summary_page2.dart';
import 'package:slam_up/screens/DashboardScreen/dashboard_page.dart';
import 'profile_page.dart';

class AllocationEntry {
  final String category;
  final double percentage;

  AllocationEntry(this.category, this.percentage);
}

class SummaryPage3 extends StatefulWidget {
  @override
  _SummaryPage3State createState() => _SummaryPage3State();
}

class _SummaryPage3State extends State<SummaryPage3> {
  List<AllocationEntry> sampleData = [
    AllocationEntry('Bills', 30),
    AllocationEntry('Food', 45),
    AllocationEntry('Travel', 25),
  ];

  List<AllocationEntry> entries = [];
  double budgetAmount = 0.0;
  List<String> calculatedAmounts = [];

  int _currentPageIndex = 2; // Set initial index to 1 for SummaryPage2

  @override
  Widget build(BuildContext context) {
    Map<String, double> data = getDataForPieChart();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
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
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
          const SizedBox(height: 10),
          Container(
            width: 270,
            height: 30,
            child: ElevatedButton(
              onPressed: () => _showBudgetInputDialog(context),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(213, 208, 202, 1.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                'Input Budget',
                style: TextStyle(
                  color: Color.fromRGBO(47, 44, 44, 1.0),
                  fontFamily: 'Poppins',
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          EditAllocationButton(
            entries: entries,
            onUpdate: (List<AllocationEntry> updatedEntries) {
              setState(() {
                entries = updatedEntries;
              });
            },
          ),
          const SizedBox(height: 35),
          PieChart(
            dataMap: data,
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            chartType: ChartType.ring,
            ringStrokeWidth: 50,
            centerText: 'Allocated\nBudget',
            legendOptions: const LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
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
          if (calculatedAmounts.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Calculated Amounts:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: calculatedAmounts.length,
                    itemBuilder: (context, index) {
                      return Text(
                        calculatedAmounts[index],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
        bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination,
      bool isActive) {
    Color backgroundColor = isActive ? Colors.white : const Color.fromRGBO(164, 199, 201, 1.0);
    Color textColor = isActive ? const Color.fromRGBO(47, 44, 44, 1.0) : const Color.fromRGBO(47, 44, 44, 1.0);

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
        padding: const EdgeInsets.all(5.0),
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

  Map<String, double> getDataForPieChart() {
    Map<String, double> data = {};

    if (entries.isNotEmpty) {
      for (var entry in entries) {
        data[entry.category] = entry.percentage;
      }
    } else {
      for (var entry in sampleData) {
        data[entry.category] = entry.percentage;
      }
    }

    return data;
  }

  void _showBudgetInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Budget Amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                budgetAmount = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _calculateAllocatedBudget();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _calculateAllocatedBudget() {
    calculatedAmounts.clear();

    Map<String, double> calculatedData = {};
    for (var entry in entries.isNotEmpty ? entries : sampleData) {
      double allocatedAmount = (budgetAmount * entry.percentage) / 100;
      calculatedData[entry.category] = allocatedAmount;

      calculatedAmounts.add('${entry.category}: ${allocatedAmount.toStringAsFixed(2)}');
    }

    setState(() {
      // Update the UI when calculated amounts are available
    });
  }
}

class EditAllocationButton extends StatelessWidget {
  final List<AllocationEntry> entries;
  final Function(List<AllocationEntry>) onUpdate;

  EditAllocationButton({required this.entries, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        color: const Color.fromRGBO(213, 208, 202, 1.0),
      ),
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditAllocationPage(entries: entries)),
          );

          if (result != null) {
            onUpdate(result);
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text(
          'Edit Allocation',
          style: TextStyle(
            color: Color.fromRGBO(47, 44, 44, 1.0),
            fontFamily: 'Poppins',
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

class EditAllocationPage extends StatefulWidget {
  final List<AllocationEntry> entries;

  EditAllocationPage({required this.entries});

  @override
  _EditAllocationPageState createState() => _EditAllocationPageState(entries);
}

class _EditAllocationPageState extends State<EditAllocationPage> {
  List<TextEditingController> categoryControllers = [TextEditingController()];
  List<TextEditingController> percentageControllers = [TextEditingController()];
  List<AllocationEntry> entries;

  _EditAllocationPageState(this.entries);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Allocation',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: categoryControllers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: categoryControllers[index],
                          decoration: const InputDecoration(labelText: 'Category'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: percentageControllers[index],
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [DecimalTextInputFormatter()],
                          decoration: const InputDecoration(labelText: 'Percentage'),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              AddCategoryButton(
                onPressed: shouldEnableAddCategoryButton(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CancelButton(),
                  SaveButton(
                    categoryControllers: categoryControllers,
                    percentageControllers: percentageControllers,
                    onSave: () {
                      if (_validateInputs()) {
                        List<AllocationEntry> entries = [];
                        for (int i = 0; i < categoryControllers.length; i++) {
                          final category = categoryControllers[i].text;
                          final percentage = double.tryParse(percentageControllers[i].text) ?? 0.0;
                          entries.add(AllocationEntry(category, percentage));
                        }
                        Navigator.pop(context, entries);
                      } else {
                        // Show error dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Fields cannot be empty.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback? shouldEnableAddCategoryButton() {
    double totalPercentage = calculateTotalPercentage();
    return totalPercentage < 100 ? () => addCategory() : null;
  }

  double calculateTotalPercentage() {
    double totalPercentage = 0.0;
    for (int i = 0; i < categoryControllers.length; i++) {
      double percentage = double.tryParse(percentageControllers[i].text) ?? 0.0;
      totalPercentage += percentage;
    }
    return totalPercentage;
  }

  bool _validateInputs() {
    for (var controller in categoryControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    for (var controller in percentageControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void addCategory() {
    String category = categoryControllers[0].text;
    double percentage = double.tryParse(percentageControllers[0].text) ?? 0.0;

    final newEntry = AllocationEntry(category, percentage);
    entries.add(newEntry);

    categoryControllers.add(TextEditingController());
    percentageControllers.add(TextEditingController());

    setState(() {});
  }
}

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 110,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(178, 22, 22, 1.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final List<TextEditingController> categoryControllers;
  final List<TextEditingController> percentageControllers;
  final VoidCallback onSave;

  SaveButton({
    required this.categoryControllers,
    required this.percentageControllers,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 110,
      child: ElevatedButton(
        onPressed: () {
          if (_validateInputs()) {
            onSave();
          } else {
            // Show error dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Fields cannot be empty.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(0, 139, 22, 1.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    for (var controller in categoryControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    for (var controller in percentageControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }
}

class AddCategoryButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddCategoryButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 35,
        width: 400,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(164, 199, 201, 1.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: const Text(
            '+  Add Category',
            style: TextStyle(
              color: Color.fromRGBO(47, 44, 44, 1.0),
              fontFamily: 'Poppins',
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '0');
    }
    double value = double.tryParse(newValue.text) ?? 0.0;
    return newValue.copyWith(text: value.toString());
  }
}

void main() {
  runApp(MaterialApp(
    home: SummaryPage3(),
  ));
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
