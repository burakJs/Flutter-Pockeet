import 'package:flutter/material.dart';
import 'package:pockeet/product/models/transaction_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/constants/color_constants.dart';

class TotalChart extends StatefulWidget {
  const TotalChart({Key? key, required this.data}) : super(key: key);
  final List<TransactionModel> data;

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {
  final ColorConstants colors = ColorConstants.instance;

  @override
  void didUpdateWidget(covariant TotalChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<TransactionModel, int>>[
        AreaSeries(
          dataSource: widget.data,
          xValueMapper: (TransactionModel model, _) => model.date?.toDate().day,
          yValueMapper: (TransactionModel model, _) => model.money,
          color: colors.primaryPurpleColor,
          xAxisName: 'Day',
          yAxisName: 'Money',
          name: 'Total',
        ),
      ],
    );
  }
}
