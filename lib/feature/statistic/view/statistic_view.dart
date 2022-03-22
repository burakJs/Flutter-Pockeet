import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';

class StatisticView extends StatefulWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  State<StatisticView> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> with SingleTickerProviderStateMixin {
  final ColorConstants colors = ColorConstants.instance;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

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
            Expanded(
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: colors.grayColor,
                onTap: (i) => setState(() {}),
                tabs: [
                  Tab(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: _tabController.index == 0 ? colors.primaryPurpleColor : colors.blackCardBackgroundColor,
                        borderRadius: context.lowBorderRadius,
                      ),
                      duration: context.durationLow,
                      child: Center(child: Text(LocaleKeys.statistic_income.tr())),
                    ),
                  ),
                  Tab(
                    child: AnimatedContainer(
                      duration: context.durationLow,
                      decoration: BoxDecoration(
                        color: _tabController.index == 1 ? colors.primaryPurpleColor : colors.blackCardBackgroundColor,
                        borderRadius: context.lowBorderRadius,
                      ),
                      child: Center(child: Text(LocaleKeys.statistic_expanse.tr())),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: context.paddingNormal,
                child: _balanceAndCalendarRow(context, colors),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(color: context.randomColor),
            ),
            Expanded(
              child: Container(color: context.randomColor),
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
