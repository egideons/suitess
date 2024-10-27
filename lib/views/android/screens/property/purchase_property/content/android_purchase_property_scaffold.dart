import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../controllers/app/purchase_property_controller.dart';
import '../../../../../../theme/colors.dart';
import 'android_atm_card_expansion_tile.dart';
import 'android_atm_card_option.dart';
import 'android_payment_method.dart';

class AndroidPurchasePropertyScaffold
    extends GetView<PurchasePropertyController> {
  const AndroidPurchasePropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
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
              SvgPicture.asset(Assets.androidPaymentMethod),
              kHalfSizedBox,
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
              androidPaymentMethod(
                colorScheme,
                icon: Assets.walletFilledIconSvg,
                title: "Wallet",
                selectPaymentMethod: controller.payWithWallet,
              ),
              kSizedBox,
              androidAtmCardExpansionTile(
                colorScheme,
                children: [
                  androidAtmCardOption(
                    colorScheme,
                    selectOption: controller.payWithATMCard,
                    cardType: Assets.visaPng,
                    cardNumber: "255743973497434",
                    expiryDate: DateTime.now(),
                  ),
                  kHalfSizedBox,
                  androidAtmCardOption(
                    colorScheme,
                    selectOption: controller.payWithATMCard,
                    cardType: Assets.mastercardPng,
                    cardNumber: "255743973497434",
                    expiryDate: DateTime.now(),
                  ),
                ],
              ),
              kSizedBox,
              androidPaymentMethod(
                colorScheme,
                icon: Assets.bankBuildingSvg,
                title: "Bank Transfer",
                selectPaymentMethod: controller.payWithBankTransfer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
