import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';
import 'package:pockeet/product/tabbar/app_tabbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../product/containers/total_container.dart';

class _SalesData {
  _SalesData(this.day, this.sales);

  final int day;
  final double sales;
}

class StatisticView extends StatelessWidget {
  StatisticView({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primaryPurpleColor,
        title: Text(LocaleKeys.appBar_title_statistic.tr()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: AppTabbar(),
            ),
            Expanded(
              child: Padding(
                padding: context.paddingNormal,
                child: _balanceAndCalendarRow(context, colors),
              ),
            ),
            Expanded(
              flex: 3,
              child: SfCartesianChart(
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
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TotalContainer(
                      bgColor: colors.darkBlueColor,
                      icon: Icons.arrow_circle_up_outlined,
                      money: LocaleKeys.statistic_income.tr(),
                      title: '\$5.609',
                    ),
                  ),
                  Expanded(
                    child: TotalContainer(
                      bgColor: colors.lightRedColor,
                      icon: Icons.arrow_circle_down_outlined,
                      money: LocaleKeys.statistic_expanse.tr(),
                      title: '\$5.609',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _balanceAndCalendarRow(BuildContext context, ColorConstants colors) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _totalBalanceText(context),
            const Spacer(),
            _balanceText(context, colors),
            const Spacer(),
          ],
        ),
        const Spacer(),
        _calendarBackgroundContainer(colors, context),
      ],
    );
  }

  Text _totalBalanceText(BuildContext context) {
    return Text(
      LocaleKeys.statistic_totalBalance.tr(),
      style: context.textTheme.titleMedium,
    );
  }

  Text _balanceText(BuildContext context, ColorConstants colors) {
    return Text(
      '\$687.134',
      style: context.textTheme.headline4?.copyWith(
        color: colors.yellowColor,
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    );
  }

  Container _calendarBackgroundContainer(ColorConstants colors, BuildContext context) {
    return Container(
      color: colors.blackCardBackgroundColor,
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [_calendarText(context), context.emptySizedWidthBoxNormal, _calendarContainer(context, colors)],
        ),
      ),
    );
  }

  Text _calendarText(BuildContext context) {
    return Text(
      'Jan, 2022',
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 21,
      ),
    );
  }

  Container _calendarContainer(BuildContext context, ColorConstants colors) {
    return Container(
      width: context.dynamicWidth(0.11),
      height: context.dynamicWidth(0.11),
      decoration: BoxDecoration(
        color: colors.primaryPurpleColor,
        borderRadius: context.lowBorderRadius,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.calendar_today),
      ),
    );
  }
}
