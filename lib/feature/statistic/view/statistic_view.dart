import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/feature/statistic/viewmodel/transaction_state.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import 'package:pockeet/product/models/transaction_model.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/chart/total_chart.dart';
import '../../../product/models/user_model.dart';
import '../../../product/tabbar/app_tabbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../product/containers/total_container.dart';
import '../viewmodel/total_balance_bloc.dart';
import '../viewmodel/transaction_bloc.dart';

class StatisticView extends StatelessWidget {
  StatisticView({Key? key}) : super(key: key);

  final ColorConstants colors = ColorConstants.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primaryPurpleColor,
        title: Text(LocaleKeys.appBar_title_statistic.tr()),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => StatisticBloc()..getAllTransactionByIncome(),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    return AppTabbar(
                      changeCallBack: (int index) {
                        context.read<StatisticBloc>().changeIncome();
                      },
                    );
                  },
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
                child: BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    if (state is StatisticLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return TotalChart(
                        data: (state as StatisticSuccess).list,
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _incomeTotalContainer(),
                    _expanseTotalContainer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _expanseTotalContainer() {
    return BlocProvider(
      create: (context) => TotalBalanceBloc()..getTotalExpanse(),
      child: BlocBuilder<TotalBalanceBloc, double>(
        builder: (context, state) {
          return Expanded(
            child: TotalContainer(
              bgColor: colors.lightRedColor,
              icon: Icons.arrow_circle_down_outlined,
              money: LocaleKeys.statistic_expanse.tr(),
              title: '\$$state',
            ),
          );
        },
      ),
    );
  }

  Widget _incomeTotalContainer() {
    return BlocProvider<TotalBalanceBloc>(
      create: (context) => TotalBalanceBloc()..getTotalIncome(),
      child: Expanded(
        child: BlocBuilder<TotalBalanceBloc, double>(
          builder: (context, state) {
            return TotalContainer(
              bgColor: colors.darkBlueColor,
              icon: Icons.arrow_circle_up_outlined,
              money: LocaleKeys.statistic_income.tr(),
              title: '\$$state',
            );
          },
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

  Widget _balanceText(BuildContext context, ColorConstants colors) {
    return BlocProvider(
      create: (context) => TotalBalanceBloc()..getTotalBalance(),
      child: BlocBuilder<TotalBalanceBloc, double>(
        builder: (context, state) {
          return Text(
            '\$$state',
            style: context.textTheme.headline4?.copyWith(
              color: colors.yellowColor,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
          );
        },
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
        onPressed: () async {
          final TransactionManager manager = TransactionManager(FirebaseManager());
          print((await manager.getAllTransaction()).length);
        },
        icon: const Icon(Icons.calendar_today),
      ),
    );
  }
}
