import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../core/constants/color_constants.dart';

class AppTabbar extends StatefulWidget {
  const AppTabbar({Key? key, required this.changeCallBack}) : super(key: key);
  final void Function(int index) changeCallBack;
  @override
  State<AppTabbar> createState() => _AppTabbarState();
}

class _AppTabbarState extends State<AppTabbar> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ColorConstants colors = ColorConstants.instance;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: colors.grayColor,
      onTap: (i) => setState(() {
        widget.changeCallBack(i);
      }),
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
    );
  }
}
