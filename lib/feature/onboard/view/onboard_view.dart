import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/constants/navigation_constants.dart';
import '../../../core/data/concrete/firebase_manager.dart';
import '../../../core/init/locale/locale_manager.dart';
import '../../../core/init/navigation/concrete/navigation_manager.dart';
import '../../../core/constants/color_constants.dart';
import '../../../product/widget/custom_button.dart';

import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  ColorConstants colors = ColorConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: contents.length,
        itemBuilder: (_, i) {
          return Column(children: [
            _onboardPicture(i),
            Expanded(
              flex: 4,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                _titleText(i, context),
                _descriptionText(i, context),
                BuildDot(currentIndex: currentIndex),
                CustomButton(
                    title: 'Get Started',
                    color: colors.pinkColor,
                    ontap: () async {
                      if (currentIndex == contents.length - 1) {
                        final bool result = await LocaleManager.instance.setFirstLogin(false);
                        NavigationManager.instance.navigateToPageClear(NavigationConstants.LOGIN_PAGE);
                      } else {
                        _controller?.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
                      }
                    })
              ]),
            ),
          ]);
        },
      ),
    );
  }

  Padding _descriptionText(int i, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        contents[i].description,
        style: context.textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _titleText(int i, BuildContext context) {
    return Text(
      contents[i].title,
      style: context.textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }

  Expanded _onboardPicture(int i) {
    return Expanded(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Container(
                child: ClipOval(
                  child: Image.asset(
                    contents[i].image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    ColorConstants colors = ColorConstants.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        contents.length,
        (index) => Container(
          height: 10,
          width: index == currentIndex ? 25 : 10,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: index == currentIndex ? colors.whiteColor : colors.grayColor,
          ),
        ),
      ),
    );
  }
}
