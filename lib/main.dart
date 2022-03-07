// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incumtracker/data.dart';
import 'package:incumtracker/globalvar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Incum Tracker',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
// -------------------------------------------------
// Login Screen
// -------------------------------------------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController username = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Incum-Tracker"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: CupertinoTextField(
              focusNode: FocusNode(),
              placeholder: "Enter Your Username",
              controller: username,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 8),
          CupertinoButton(
            onPressed: () {
              setState(() {
                if (username.text.isNotEmpty) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                }
              });
            },
            child: Text("Skip SignIn For now"),
            color: CupertinoColors.activeBlue,
            padding: EdgeInsets.all(16),
            disabledColor: Colors.grey,
            pressedOpacity: 0.6,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------
// 1st Screen
// -------------------------------------------------
List<Widget> _tabs = [
  EandIPage(),
  AddPending(),
  pendingincome(),
  ShareHolding(),
  BugReport(),
];

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(8),
        middle: Text(AppTitle),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart_outline),
                  label: 'Add Data',
                  activeIcon: Icon(Icons.pie_chart_rounded)),
              BottomNavigationBarItem(
                  icon: Stack(children: [
                    Icon(Icons.add_business_outlined),
                    Positioned(
                      top: 1.0,
                      right: 0.0,
                      child: Stack(children: <Widget>[
                        Icon(Icons.brightness_1, size: 21.0, color: Colors.red),
                        Positioned(
                          top: 2.5,
                          right: 4.0,
                          child: Text(pendingexp.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ]),
                    ),
                  ]),
                  activeIcon: Icon(Icons.add_business_rounded),
                  label: 'Add pendings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pending_outlined),
                  activeIcon: Icon(Icons.pending_rounded),
                  label: 'Pending Expense'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder_shared_outlined),
                  activeIcon: Icon(Icons.folder_shared_rounded),
                  label: 'Share Holding'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bug_report_outlined),
                  activeIcon: Icon(Icons.bug_report_rounded),
                  label: 'bug Report'),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}

// -------------------------------------------------
// Expense and income page main
// -------------------------------------------------

DateTime? selectedDate;

class EandIPage extends StatefulWidget {
  const EandIPage({Key? key}) : super(key: key);

  @override
  State<EandIPage> createState() => _EandIPageState();
}

final TextEditingController income = TextEditingController();
final TextEditingController expense = TextEditingController();
final TextEditingController inhand = TextEditingController();
// final TextEditingController Datekey = date();

class _EandIPageState extends State<EandIPage> {
  // late Future<Album> futureAlbum;
  // late Future<Album>? _futureAlbum;

  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = fetchAlbum();
  // }

  void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 500,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: CupertinoDatePicker(
                    // key: Datekey,
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.mdy,
                    onDateTimeChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                    initialDateTime: DateTime.now(),
                  ),
                ),
                CupertinoButton(
                  child: Text("Select"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18.0, bottom: 60.0, top: 60),
            child: Column(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    "Fusce cursus enim a libero finibus suscipit ac vel odio."
                    "Vestibulum ac lobortis velit. Sed vitae lorem pulvinar,"
                    "luctus risus a, dignissim nibh. Mauris sed vehicula enim."),
                const SizedBox(height: 14),
                CupertinoTextField(
                  focusNode: FocusNode(
                      canRequestFocus: false,
                      descendantsAreFocusable: false,
                      skipTraversal: true),
                  controller: income,
                  keyboardType: TextInputType.number,
                  placeholder: "Enter Income",
                  prefix: const Icon(Icons.attach_money_sharp),
                  // decoration: InputDecoration(
                  //   // filled: true,
                  //   hoverColor: Colors.blue.shade100,
                  //   // focusColor: Colors.blue.shade100,
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //   hintText: "Enter Income",
                  //   suffixIcon: const Icon(Icons.attach_money_sharp),
                  // ),
                ),
                const SizedBox(height: 8),
                CupertinoTextField(
                  focusNode: FocusNode(
                      canRequestFocus: false,
                      descendantsAreFocusable: false,
                      skipTraversal: true),
                  prefix: const Icon(Icons.attach_money_sharp),
                  placeholder: "Enter Expense",
                  controller: expense,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                CupertinoTextField(
                  focusNode: FocusNode(
                      canRequestFocus: false,
                      descendantsAreFocusable: false,
                      skipTraversal: true),
                  prefix: const Icon(Icons.attach_money_sharp),
                  placeholder: "Enter Inhand ",
                  controller: inhand,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                CupertinoButton(
                    child: Text(selectedDate == null
                        ? "Click here to Select Date"
                        : "$selectedDate"),
                    onPressed: () {
                      setState(() {
                        showDatePicker();
                      });
                    }),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            // dataRows.add(
                            //   DataRow(
                            //     cells: [
                            //       DataCell(
                            //         FutureBuilder<Album>(
                            //           future: futureAlbum,
                            //           builder: (context, snapshot) {
                            //             if (snapshot.hasData) {
                            //               return Text(snapshot.data!.date);
                            //             } else if (snapshot.hasError) {
                            //               return Text('${snapshot.error}');
                            //             }

                            //             return const CircularProgressIndicator();
                            //           },
                            //         ),
                            //       ),
                            //       DataCell(
                            //         FutureBuilder<Album>(
                            //           future: futureAlbum,
                            //           builder: (context, snapshot) {
                            //             if (snapshot.hasData) {
                            //               return Text(snapshot.data!.income);
                            //             } else if (snapshot.hasError) {
                            //               return Text('${snapshot.error}');
                            //             }

                            //             return const CircularProgressIndicator();
                            //           },
                            //         ),
                            //       ),
                            //       DataCell(
                            //         FutureBuilder<Album>(
                            //           future: futureAlbum,
                            //           builder: (context, snapshot) {
                            //             if (snapshot.hasData) {
                            //               return Text(snapshot.data!.expense
                            //                   .toString());
                            //             } else if (snapshot.hasError) {
                            //               return Text('${snapshot.error}');
                            //             }

                            //             return const CircularProgressIndicator();
                            //           },
                            //         ),
                            //       ),
                            //       DataCell(
                            //         FutureBuilder<Album>(
                            //           future: futureAlbum,
                            //           builder: (context, snapshot) {
                            //             if (snapshot.hasData) {
                            //               return Text(snapshot.data!.income);
                            //             } else if (snapshot.hasError) {
                            //               return Text('${snapshot.error}');
                            //             }

                            //             return const CircularProgressIndicator();
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // );
                          });
                        },
                        icon: Icon(Icons.refresh)),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          if (expense.text.isNotEmpty &&
                              income.text.isNotEmpty &&
                              inhand.text.isNotEmpty) {
                            // _futureAlbum = createAlbum(selectedDate.toString(),
                            //     income.text, expense.text, inhand.text);
                            dataRows.add(
                              DataRow(
                                cells: [
                                  DataCell(Text(selectedDate.toString())),
                                  DataCell(Text(income.text)),
                                  DataCell(Text(expense.text)),
                                  DataCell(Text(income.text + expense.text)),
                                ],
                              ),
                            );
                            income.clear();
                            expense.clear();
                            inhand.clear();
                          }
                          //
                        });
                      },
                      child: const Text('Add Income and Expense Data'),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            dataRows.clear();
                          });
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
                const SizedBox(height: 8),
                //Table
                _createDataTable(),
                // Graph
              ],
            )),
      ),
    );
  }
}

List<DataRow> dataRowspen = [];
List<DataRow> dataRows = [];

DataTable _createDataTable() {
  return DataTable(
    columns: _createColumns(),
    rows: _createRows(),
    dividerThickness: 2,
    showBottomBorder: true,
    headingTextStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    headingRowColor:
        MaterialStateProperty.resolveWith((states) => Colors.blueGrey),
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

List<DataRow> _createRowspen() {
  return dataRowspen;
}

List<DataRow> _createRows() {
  return dataRows;
}

// -------------------------------------------------
// 1st Screen
// -------------------------------------------------
class AddPending extends StatefulWidget {
  const AddPending({Key? key})
      : super(
          key: key,
        );

  @override
  State<AddPending> createState() => _AddPendingState();
}

final TextEditingController pendingexp = TextEditingController();

class _AddPendingState extends State<AddPending> {
  late Future<Album> futureAlbum;
  Future<Album>? _futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 60.0, top: 60),
      child: Column(
        children: [
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
              "Fusce cursus enim a libero finibus suscipit ac vel odio."
              "Vestibulum ac lobortis velit. Sed vitae lorem pulvinar,"
              "luctus risus a, dignissim nibh. Mauris sed vehicula enim."),
          const SizedBox(height: 14),
          CupertinoTextField(
            focusNode: FocusNode(
                canRequestFocus: false,
                descendantsAreFocusable: false,
                skipTraversal: true),
            prefix: const Icon(Icons.attach_money_sharp),
            placeholder: "Enter Pending",
            controller: pendingexp,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 8),
          CupertinoButton(
              child: Text("Submit"),
              onPressed: () {
                setState(() {
                  if (pendingexp.text.isNotEmpty) {
                    dataRows.add(
                      DataRow(
                        cells: [
                          DataCell(Text(pendingexp.text)),
                        ],
                      ),
                    );
                  } else {
                    const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Fill the values!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              }),
          SizedBox(height: 10),
          Text(
            "Pending Expense: ${pendingexp.text}",
            style: TextStyle(fontSize: 50, color: Colors.red),
          ),
        ],
      ),
    ));
  }
}

// -------------------------------------------------
// PendingIncome page main
// -------------------------------------------------

class pendingincome extends StatefulWidget {
  const pendingincome({Key? key}) : super(key: key);

  @override
  State<pendingincome> createState() => _pendingincomeState();
}

final TextEditingController todoexpname = TextEditingController();
final TextEditingController todoexpamt = TextEditingController();

class _pendingincomeState extends State<pendingincome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18.0, bottom: 18.0, top: 60),
            child: Column(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    "Fusce cursus enim a libero finibus suscipit ac vel odio."
                    "Vestibulum ac lobortis velit. Sed vitae lorem pulvinar,"
                    "luctus risus a, dignissim nibh. Mauris sed vehicula enim."),
                const SizedBox(height: 14),
                CupertinoTextField(
                  focusNode: FocusNode(
                      canRequestFocus: false,
                      descendantsAreFocusable: false,
                      skipTraversal: true),
                  placeholder: "Enter Expense Name",
                  controller: todoexpname,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CupertinoTextField(
                  focusNode: FocusNode(
                      canRequestFocus: false,
                      descendantsAreFocusable: false,
                      skipTraversal: true),
                  prefix: const Icon(Icons.attach_money_sharp),
                  placeholder: "Enter Expense Amount",
                  controller: todoexpamt,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                CupertinoButton(
                    child: Text("Submit"),
                    onPressed: () {
                      setState(() {
                        if (todoexpamt.text.isNotEmpty &&
                            todoexpname.text.isNotEmpty) {
                          dataRowspen.add(
                            DataRow(
                              cells: [
                                DataCell(Text(todoexpamt.text)),
                                DataCell(Text(todoexpname.text)),
                                DataCell(TextButton(
                                    onPressed: () {
                                      setState(() {
                                        dataRowspen.remove(1);
                                      });
                                    },
                                    child: Text("Delete"))),
                              ],
                            ),
                          );
                        }
                      });
                    }),
                DataTable(
                  columns: [
                    DataColumn(label: Text('EXPENSE NAME')),
                    DataColumn(label: Text('AMOUNT')),
                    DataColumn(label: Text('DELETE')),
                  ],
                  rows: _createRowspen(),
                  dividerThickness: 2,
                  showBottomBorder: true,
                  headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------
// Share Holding
// -------------------------------------------------

class ShareHolding extends StatefulWidget {
  const ShareHolding({Key? key}) : super(key: key);

  @override
  State<ShareHolding> createState() => _ShareHoldingState();
}

class _ShareHoldingState extends State<ShareHolding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}

// -------------------------------------------------
// Bug Report
// -------------------------------------------------

class BugReport extends StatefulWidget {
  const BugReport({Key? key}) : super(key: key);

  @override
  State<BugReport> createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Fuck You and your bugs :/"),
      ),
    );
  }
}

//
//
// //

// class Faked extends StatefulWidget {
//   const Faked({Key? key}) : super(key: key);

//   @override
//   State<Faked> createState() => _FakedState();
// }

// class _FakedState extends State<Faked> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection("table")
//           .doc(widget.tablename)
//           .collection("ordering")
//           .where("plated", isEqualTo: false)
//           .snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (!snapshot.hasData) {
//           return Text("No order Found");
//         }

//         return SizedBox(
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 print(snapshot.data!.docs[index]["food"]);
//                 return CardinsideText(
//                     snapshot.data!.docs[index]["food"],
//                     snapshot.data!.docs[index]["counter"],
//                     widget.tablename,
//                     snapshot.data!.docs[index].id);
//               }),
//         );
//       },
//     ));
//   }
// }
