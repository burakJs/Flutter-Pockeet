import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../core/constants/color_constants.dart';

class TransactionTabbar extends StatefulWidget {
  const TransactionTabbar({Key? key, required this.callBack}) : super(key: key);
  final void Function(int index) callBack;
  @override
  State<TransactionTabbar> createState() => _TransactionTabbarState();
}

class _TransactionTabbarState extends State<TransactionTabbar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ColorConstants colors = ColorConstants.instance;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: colors.grayColor,
      //onTap: (i) => setState(() {}),
      tabs: [
        InkWell(
          onTap: () {
            setState(() {
              _tabController.index = 0;
              widget.callBack(0);
            });
          },
          child: Tab(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _tabController.index == 0
                    ? colors.primaryPurpleColor
                    : colors.blackCardBackgroundColor,
                borderRadius: context.lowBorderRadius,
              ),
              duration: context.durationLow,
              child: Center(child: Text('All')),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _tabController.index = 1;
              widget.callBack(1);
            });
          },
          child: Tab(
            child: AnimatedContainer(
              duration: context.durationLow,
              decoration: BoxDecoration(
                color: _tabController.index == 1
                    ? colors.primaryPurpleColor
                    : colors.blackCardBackgroundColor,
                borderRadius: context.lowBorderRadius,
              ),
              child: Center(child: Text('Income')),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _tabController.index = 2;
              widget.callBack(2);
            });
          },
          child: Tab(
            child: AnimatedContainer(
              duration: context.durationLow,
              decoration: BoxDecoration(
                color: _tabController.index == 2
                    ? colors.primaryPurpleColor
                    : colors.blackCardBackgroundColor,
                borderRadius: context.lowBorderRadius,
              ),
              child: Center(child: Text('Expense')),
            ),
          ),
        ),
      ],
    );
  }
}
