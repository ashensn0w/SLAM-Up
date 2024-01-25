import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../utils/constants.dart';
import 'notification_page.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    Map<String, double> data = getDataForPieChart();

    return Scaffold(
      backgroundColor: Colors.white,
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
          Center(
            child: BudgetAllocation(),
          ),
          SizedBox(height: 20),
          EditAllocationButton(
            entries: entries,
            onUpdate: (List<AllocationEntry> updatedEntries) {
              setState(() {
                entries = updatedEntries;
              });
            },
          ),
          SizedBox(height: 80),
          PieChart(
            dataMap: data,
            chartRadius: MediaQuery.of(context).size.width / 1.9,
            chartType: ChartType.ring,
            ringStrokeWidth: 60,
            centerText: 'Allocated\nBudget',
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
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
        ],
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
}

class BudgetAllocation extends StatelessWidget {
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
          'Budget Allocation',
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

class EditAllocationButton extends StatelessWidget {
  final List<AllocationEntry> entries;
  final Function(List<AllocationEntry>) onUpdate;

  EditAllocationButton({required this.entries, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromRGBO(213, 208, 202, 1.0),
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
        child: Text(
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
        title: Text(
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
                          decoration: InputDecoration(labelText: 'Category'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: percentageControllers[index],
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [DecimalTextInputFormatter()],
                          decoration: InputDecoration(labelText: 'Percentage'),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              AddCategoryButton(
                onPressed: shouldEnableAddCategoryButton(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CancelButton(),
                  SaveButton(
                    categoryControllers: categoryControllers,
                    percentageControllers: percentageControllers,
                    onSave: () {
                      List<AllocationEntry> entries = [];
                      for (int i = 0; i < categoryControllers.length; i++) {
                        final category = categoryControllers[i].text;
                        final percentage = double.tryParse(percentageControllers[i].text) ?? 0.0;
                        entries.add(AllocationEntry(category, percentage));
                      }
                      Navigator.pop(context, entries);
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
          backgroundColor: Color.fromRGBO(178, 22, 22, 1.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
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
        onPressed: onSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(0, 139, 22, 1.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
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
            backgroundColor: Color.fromRGBO(164, 199, 201, 1.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Text(
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
