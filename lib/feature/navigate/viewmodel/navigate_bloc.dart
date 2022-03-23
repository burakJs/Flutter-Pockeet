import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pockeet/feature/homepage/home_view.dart';
import 'package:pockeet/feature/statistic/view/statistic_view.dart';
import 'package:pockeet/feature/transaction/view/transaction_view.dart';

class NavigateBloc extends Cubit<int> {
  NavigateBloc() : super(0);

  int index = 0;
  final List<Widget> pages = [
    HomeView(),
    TransactionView(),
    StatisticView(),
    TransactionView(),
    StatisticView(),
  ];

  void changePage(int pageIndex) {
    index = pageIndex;
    emit(index);
  }
}
