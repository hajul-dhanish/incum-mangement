// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:incum_tracker/globalvar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(AppTitle),
          ),
          body: FirstRoute(),
        ));
  }
}
// -------------------------------------------------
// Login Screen
// -------------------------------------------------

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(168.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondRoute()));
          },
          child: SizedBox(
            child: Stack(alignment: Alignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.network(
                  "https://i.pinimg.com/736x/cb/fa/63/cbfa6357158f0f3bde4ffcc8761aeb9d.jpg",
                ),
              ),
              const Text(
                "New User? \nRegister here \nWill Skip for now :)",
                style: TextStyle(color: Colors.white),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------
// 1st Screen
// -------------------------------------------------

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Buddy :)"),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EandIPage()),
                );
              },
              child: const Text('Expense and Income'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pendingincome()),
                );
              },
              child: const Text('Pending Amound'),
            ),
          ],
        )),
      ),
    );
  }
}

// -------------------------------------------------
// Expense and income page main
// -------------------------------------------------

class EandIPage extends StatefulWidget {
  const EandIPage({Key? key}) : super(key: key);

  @override
  State<EandIPage> createState() => _EandIPageState();
}

final TextEditingController income = TextEditingController();
final TextEditingController expense = TextEditingController();

class _EandIPageState extends State<EandIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income And Expense Management"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2001, 01, 09),
                              maxTime: DateTime.now(), onChanged: (date) {
                            // print('change $date');
                          }, onConfirm: (date) {
                            // print('confirm $date');
                          },
                              // currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text("Choose Custom Date")),
                    TextFormField(
                      controller: income,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // filled: true,
                        hoverColor: Colors.blue.shade100,
                        // focusColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: "Enter Income",
                        suffixIcon: const Icon(Icons.attach_money_sharp),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: expense,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // filled: true,
                        hoverColor: Colors.blue.shade100,
                        // focusColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: "Enter Expense",

                        suffixIcon: const Icon(Icons.attach_money_sharp),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (expense.text.isNotEmpty &&
                              income.text.isNotEmpty) {
                            dataRows.add(DataRow(cells: [
                              DataCell(Text(DateTime.now().toString())),
                              DataCell(Text(income.text)),
                              DataCell(Text(expense.text)),
                              DataCell(Text(income.text + expense.text)),
                            ]));
                          } else {
                            const snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Please Fill the values!'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          //
                        });
                      },
                      child: const Text('Submit'),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                //Table
                _createDataTable(),
                // Graph
                const SizedBox(height: 18),
                Text("Graph Will be added in upcoming build")
              ],
            )),
      ),
    );
  }
}

List<DataRow> dataRows = [];

DataTable _createDataTable() {
  return DataTable(
    columns: _createColumns(),
    rows: _createRows(),
    dividerThickness: 5,
    dataRowHeight: 80,
    showBottomBorder: true,
    headingTextStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    headingRowColor:
        MaterialStateProperty.resolveWith((states) => Colors.black),
  );
}

List<DataColumn> _createColumns() {
  return [
    DataColumn(label: Text('DATE')),
    DataColumn(label: Text('INCOME')),
    DataColumn(label: Text('EXPENSE')),
    DataColumn(label: Text('PROFIT')),
  ];
}

List<DataRow> _createRows() {
  return dataRows;
}

// -------------------------------------------------
// PendingIncome page main
// -------------------------------------------------

class pendingincome extends StatefulWidget {
  const pendingincome({Key? key}) : super(key: key);

  @override
  State<pendingincome> createState() => _pendingincomeState();
}

class _pendingincomeState extends State<pendingincome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            "Pending Expense: ${income.text}",
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
