import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/controllers/app/purchase_property_controller.dart';
import '../../../../../theme/colors.dart';

class PurchasePropertyScaffold extends GetView<PurchasePropertyController> {
  const PurchasePropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Payment method"),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              SvgPicture.asset(Assets.paymentMethod),
              kSmallSizedBox,
              Text(
                "Kindly select a payment method",
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              kBigSizedBox,
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: .5,
                        color: colorScheme.inversePrimary.withOpacity(.4),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.walletFilledIconSvg,
                        color: kAccentColor,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        "Wallet",
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kSizedBox,
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: .5,
                      color: colorScheme.inversePrimary.withOpacity(.4),
                    ),
                  ),
                ),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kTransparentColor),
                  ),
                  dense: true,
                  initiallyExpanded: true,
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.bankBuildingSvg,
                        color: kAccentColor,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        "ATM Card",
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    atmCardOption(
                      colorScheme,
                      selectOption: () {},
                      cardType: Assets.visaPng,
                      cardNumber: "255743973497434",
                      expiryDate: DateTime.now(),
                    ),
                    kHalfSizedBox,
                    atmCardOption(
                      colorScheme,
                      selectOption: () {},
                      cardType: Assets.mastercardPng,
                      cardNumber: "255743973497434",
                      expiryDate: DateTime.now(),
                    ),
                  ],
                ),
              ),
              kSizedBox,
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: .5,
                        color: colorScheme.inversePrimary.withOpacity(.4),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.bankBuildingSvg,
                        color: kAccentColor,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        "Bank Transfer",
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  atmCardOption(
    ColorScheme colorScheme, {
    void Function()? selectOption,
    String? cardType,
    String? cardNumber,
    DateTime? expiryDate,
  }) {
    return InkWell(
      onTap: selectOption ?? () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: .5,
              color: colorScheme.inversePrimary.withOpacity(.4),
            ),
          ),
        ),
        child: Row(
          children: [
            Image.asset(cardType ?? "", height: 40, width: 60),
            kHalfWidthSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maskCardNumber(cardNumber ?? "0000"),
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Expires ",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: formatDayAndMonth(expiryDate ?? DateTime.now()),
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
