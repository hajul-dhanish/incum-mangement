import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incumtracker/main.dart';

// const String AppTitle = "Incum Tracker";
String AppTitle = "Welcome ${username.text}";

// -------------------------------------------------
// Custom Form
// -------------------------------------------------

// Widget CustomFormField() {
//   return TextFormField(
//     controller: Validation,
//     keyboardType: TextInputType.number,
//     decoration: InputDecoration(
//       filled: true,
//       hoverColor: Colors.blue.shade100,
//       // focusColor: Colors.blue.shade100,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//       ),
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       hintText: "label",
//       suffixIcon: const Icon(Icons.attach_money_sharp),
//     ),
//     validator: (text) {
//       if (text == null || text.isEmpty) {
//         return 'Please enter the values';
//       }
//       return null;
//     },
//   );
// }
