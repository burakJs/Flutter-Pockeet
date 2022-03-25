import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';

import 'package:pockeet/feature/transaction/viewmodel/transaction_cubit.dart';
import 'package:pockeet/feature/transaction/viewmodel/transaction_state.dart';

import '../../../core/constants/color_constants.dart';

import '../../../product/tabbar/transaction_tabbar.dart';
import '../../../product/util/page_border_radius.dart';
import '../../../product/widget/custom_list_tile.dart';

class TransactionView extends StatelessWidget {
  ColorConstants colors = ColorConstants.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit(),
      child: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colors.primaryPurpleColor,
            appBar: _appBar(),
            body: _buildbody(context, state),
          );
        },
      ),
    );
  }

  Container _buildbody(BuildContext context, TransactionState state) {
    return Container(
      decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: PageBorderRadius.topSide()),
      child: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          _tabbar(context),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          _listView(state)
        ],
      ),
    );
  }

  Container _tabbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: colors.blackCardBackgroundColor),
      child: TransactionTabbar(
        callBack: (int index) async {
          if (index == 0) {
            context.read<TransactionCubit>().getAllTransaction();
          } else if (index == 2) {
            context.read<TransactionCubit>().getIsIncomeTransaction(false);
          } else if (index == 1) {
            context.read<TransactionCubit>().getIsIncomeTransaction(true);
          }
        },
      ),
      height: 70,
      width: context.dynamicWidth(0.8),
    );
  }

  Widget _listView(TransactionState state) {
    if (state is TransactionLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is TransactionComplete) {
      return Expanded(
        child: ListView.builder(
            itemCount: state.items?.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                model: state.items![index],
              );
            }),
      );
    } else {
      return Text('');
    }
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Transactions'),
      centerTitle: true,
      backgroundColor: colors.primaryPurpleColor,
      elevation: 0,
    );
  }
}
