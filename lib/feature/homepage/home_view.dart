import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pockeet/core/constants/color_constants.dart';
import 'package:pockeet/core/constants/image_constants.dart';
import 'package:pockeet/core/init/lang/locale_keys.g.dart';
import 'package:pockeet/feature/product/widget/pay_top_transfer_button.dart';
import 'package:pockeet/feature/product/widget/payment_list_button.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ColorConstants colors = ColorConstants.instance;
  final ImageConstants images = ImageConstants.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                          "D",
                          style: TextStyle(color: colors.whiteColor),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: colors.grayColor,
                          ),
                        ),
                        Text(
                          "Devon Albex",
                          style: TextStyle(
                              color: colors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child:
                          Center(child: Image.asset("assets/icons/Bell.png")),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images.cardBackground))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Avaliable Balance",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: colors.whiteColor),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 40, top: 5),
                                child: Text(
                                  "\$687.134",
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: colors.yellowColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 130,
                    child: Container(
                      width: 260,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: colors.blackCardBackgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HomeButton(
                                title: "Pay",
                                image: Image.asset(images.wallet)),
                            HomeButton(
                                title: "Top Up",
                                image: Image.asset(images.upload)),
                            HomeButton(
                                title: "Transfer",
                                image: Image.asset(images.arrowsLeftRight)),
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
                      "Payment List",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: colors.whiteColor),
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
                  PaymentListButton(
                      colors: colors,
                      imageName: images.lightning,
                      title: "Electricity"),
                  PaymentListButton(
                      colors: colors,
                      imageName: images.wifiHigh,
                      title: "Internet"),
                  PaymentListButton(
                      colors: colors,
                      imageName: images.gameController,
                      title: "Games"),
                  PaymentListButton(
                      colors: colors,
                      imageName: images.circlesFour,
                      title: "More"),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Last Transaction",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: colors.whiteColor),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 18, color: colors.primaryPurpleColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: colors.blackCardBackgroundColor,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF7997ff),
                      child: Center(
                        child: Text(
                          "D",
                          style: TextStyle(color: Color(0xFF1f1e34)),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Floyd Miles",
                        style: TextStyle(
                            color: colors.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    subtitle: const Text(
                      "10 Jan 2022 / 3.06 AM",
                      style: TextStyle(
                          color: Color(0xFF9c9b9e),
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      "+\$22.78",
                      style: TextStyle(color: colors.darkBlueColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
