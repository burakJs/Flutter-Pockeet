import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../addtransction/addtransaction_view.dart';
import '../../homepage/home_view.dart';
import '../../statistic/view/statistic_view.dart';
import '../../transaction/view/transaction_view.dart';

class NavigateBloc extends Cubit<int> {
  NavigateBloc() : super(0);

  int index = 0;
  final List<Widget> pages = [
    HomeView(),
    TransactionView(),
    AddTransaction(),
    StatisticView(),
  ];

  void changePage(int pageIndex) {
    index = pageIndex;
    emit(index);
  }
}
