import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/constants/color_constants.dart';

class _SalesData {
  _SalesData(this.day, this.sales);

  final int day;
  final double sales;
}

class TotalChart extends StatelessWidget {
  TotalChart({Key? key}) : super(key: key);

  final ColorConstants colors = ColorConstants.instance;
  List<_SalesData> data = [
    _SalesData(1, 35),
    _SalesData(2, 28),
    _SalesData(3, 34),
    _SalesData(4, 32),
    _SalesData(5, 40),
    _SalesData(6, 35),
    _SalesData(7, 28),
    _SalesData(8, 34),
    _SalesData(9, 32),
    _SalesData(10, 40),
    _SalesData(11, 12),
    _SalesData(12, 32),
    _SalesData(13, 32),
    _SalesData(14, 32),
    _SalesData(15, 32),
    _SalesData(16, 35),
    _SalesData(17, 28),
    _SalesData(18, 34),
    _SalesData(19, 32),
    _SalesData(20, 40),
    _SalesData(21, 35),
    _SalesData(22, 28),
    _SalesData(23, 34),
    _SalesData(24, 32),
    _SalesData(25, 40),
    _SalesData(26, 12),
    _SalesData(27, 32),
    _SalesData(28, 32),
    _SalesData(29, 32),
    _SalesData(30, 32),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<_SalesData, int>>[
        AreaSeries(
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.day,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          color: colors.primaryPurpleColor,
          name: 'Total',
        ),
      ],
    );
  }
}
