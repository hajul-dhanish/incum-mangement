import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PirChartContent extends StatelessWidget {
  const PirChartContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(sections: pieChartSectionData));
  }
}

//
//
// Data-------------------------------------\
//
//
List<PieChartSectionData> pieChartSectionData = [
  PieChartSectionData(
    value: 20,
    title: '20%',
    color: Color(0xffed733f),
  ),
  PieChartSectionData(
    value: 35,
    title: '35%',
    color: Color(0xff584f84),
  ),
  PieChartSectionData(
    value: 15,
    title: '15%',
    color: Color(0xffd86f9b),
  ),
  PieChartSectionData(
    value: 30,
    title: '30%',
    color: Color(0xffa2663e),
  ),
];
