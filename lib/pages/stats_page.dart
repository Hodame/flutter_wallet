import 'package:flutter/material.dart';
import 'package:flutter_learn/models/chart_data.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticticPage extends StatefulWidget {
  const StaticticPage({super.key});

  @override
  State<StaticticPage> createState() => _StaticticPageState();
}

class _StaticticPageState extends State<StaticticPage> {
  final List<ChartData> data = [
    ChartData(15, 2000),
    ChartData(16, 3000),
    ChartData(19, 1000),
    ChartData(21, 6000),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Income stats'),
        Center(
          child: SfCartesianChart(
            borderWidth: 1,
            borderColor: Colors.black,
            plotAreaBorderWidth: 0,
            series: <ChartSeries<ChartData, int>>[
              SplineAreaSeries(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.balance)
            ],
            primaryXAxis: NumericAxis(
                minimum: 15,
                maximum: 21,
                // dateFormat: DateFormat.MMM(),
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 23000,
              interval: 1000,
              borderWidth: 0,
              borderColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
