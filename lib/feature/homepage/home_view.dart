import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/core/constants/image_constants.dart';
import 'package:pockeet/core/data/concrete/firebase_manager.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';
import 'package:pockeet/feature/product/widget/pay_top_transfer_button.dart';
import 'package:pockeet/feature/product/widget/payment_list_button.dart';
import 'package:pockeet/product/data/transaction_manager.dart';
import 'package:pockeet/product/models/transaction_model.dart';

import '../../product/widget/custom_list_tile.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ColorConstants colors = ColorConstants.instance;
  final ImageConstants images = ImageConstants.instance;
  final TransactionManager manager = TransactionManager(FirebaseManager());
  String name = '';
  double total = 0;
  List<TransactionModel> list = [];

  Future<void> setDatas() async {
    name = await manager.getUsername();
    total = await manager.getTotalMoney();
    list = await manager.getAllTransaction();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: colors.primaryPurpleColor,
                    child: Center(
                      child: Text(
                        name[0],
                        style: TextStyle(color: colors.whiteColor),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.appBar_title_welcomeBack.tr(),
                        style: TextStyle(
                          color: colors.grayColor,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(color: colors.whiteColor, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(child: Image.asset(images.bell)),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: colors.blackCardBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 280,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(images.cardBackground))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              LocaleKeys.home_availableBalance.tr(),
                              style: TextStyle(fontWeight: FontWeight.w500, color: colors.whiteColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 40, top: 5),
                              child: Text(
                                "\$687.134",
                                style: TextStyle(fontSize: 32, color: colors.yellowColor, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 6,
                  top: 130,
                  child: Container(
                    width: 260,
                    height: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: colors.blackCardBackgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeButton(title: LocaleKeys.home_pay.tr(), image: Image.asset(images.wallet)),
                          HomeButton(title: LocaleKeys.home_topUp.tr(), image: Image.asset(images.upload)),
                          HomeButton(title: LocaleKeys.home_transfer.tr(), image: Image.asset(images.arrowsLeftRight)),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.home_paymentList.tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: colors.whiteColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentListButton(colors: colors, imageName: images.lightning, title: LocaleKeys.home_electricity.tr()),
                PaymentListButton(colors: colors, imageName: images.wifiHigh, title: LocaleKeys.home_internet.tr()),
                PaymentListButton(colors: colors, imageName: images.gameController, title: LocaleKeys.home_games.tr()),
                PaymentListButton(colors: colors, imageName: images.circlesFour, title: LocaleKeys.home_more.tr()),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.home_lastTransaction.tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: colors.whiteColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return CustomListTile(
                    model: list[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
