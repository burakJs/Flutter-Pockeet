import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/color_constants.dart';

import '../viewmodel/navigate_bloc.dart';

class NavigateView extends StatelessWidget {
  NavigateView({Key? key}) : super(key: key);

  final ColorConstants _colors = ColorConstants.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FluidNavBar(
        defaultIndex: 0,
        onChange: (int val) => context.read<NavigateBloc>().changePage(val),
        style: FluidNavBarStyle(
          iconSelectedForegroundColor: _colors.primaryPurpleColor,
          barBackgroundColor: _colors.backgroundColor,
        ),
        icons: [
          FluidNavBarIcon(
            icon: Icons.home,
          ),
          FluidNavBarIcon(
            icon: Icons.document_scanner,
          ),
          FluidNavBarIcon(
            icon: Icons.add,
          ),
          FluidNavBarIcon(
            icon: Icons.graphic_eq,
          ),
        ],
      ),
      body: BlocBuilder<NavigateBloc, int>(
        builder: (context, state) {
          return context.read<NavigateBloc>().pages[state];
        },
      ),
    );
  }
}
