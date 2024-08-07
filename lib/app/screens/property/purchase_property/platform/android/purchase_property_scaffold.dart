import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../src/controllers/app/purchase_property_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../content/atm_card_expansion_tile.dart';
import '../../content/atm_card_option.dart';
import '../../content/payment_method.dart';

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
              paymentMethod(
                colorScheme,
                icon: Assets.walletFilledIconSvg,
                title: "Wallet",
                selectPaymentMethod: controller.payWithWallet,
              ),
              kSizedBox,
              atmCardExpansionTile(
                colorScheme,
                children: [
                  atmCardOption(
                    colorScheme,
                    selectOption: controller.payWithATMCard,
                    cardType: Assets.visaPng,
                    cardNumber: "255743973497434",
                    expiryDate: DateTime.now(),
                  ),
                  kHalfSizedBox,
                  atmCardOption(
                    colorScheme,
                    selectOption: controller.payWithATMCard,
                    cardType: Assets.mastercardPng,
                    cardNumber: "255743973497434",
                    expiryDate: DateTime.now(),
                  ),
                ],
              ),
              kSizedBox,
              paymentMethod(
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
