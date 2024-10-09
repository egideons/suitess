import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/circle_avatar_image.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/controllers/app/wallet_screen_controller.dart';
import '../../../../../../../src/utils/components/notification_bell_icon.dart';
import '../../../../../../../theme/colors.dart';
import '../../content/add_ink_well.dart';
import '../../content/income_debit_card.dart';
import '../../content/quick_action_card.dart';
import '../../content/recent_transaction.dart';
import '../../content/wallet_card.dart';

class WalletScaffold extends GetView<WalletScreenController> {
  const WalletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: circleAvatarImage(colorScheme),
        ),
        actions: [notificationBellIcon(colorScheme, controller)],
      ),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: colorScheme.secondary,
                foregroundColor: kWhiteBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              Row(
                children: [
                  walletCard(
                    colorScheme,
                    controller,
                    walletBalance: "2,372,054.02",
                    acctNumber: "0059908243",
                    bvn: "22239350048",
                  ),
                  kSmallWidthSizedBox,
                  addInkWell(colorScheme, () {}),
                ],
              ),
              kBigSizedBox,
              incomeDebitCard(
                media,
                colorScheme,
                income: 20000000000,
                debit: 17000,
              ),
              kSizedBox,
              Text(
                "Quick Actions",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kHalfSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  quickActionCard(
                    colorScheme,
                    controller.goToTransferOptions,
                    svgIcon: Assets.transferSvg,
                    title: "Transfer",
                  ),
                  quickActionCard(
                    colorScheme,
                    controller.goToAirtime,
                    svgIcon: Assets.mobileOutlineSvg,
                    title: "Airtime",
                  ),
                  quickActionCard(
                    colorScheme,
                    controller.gotToMobileData,
                    svgIcon: Assets.wifiOutlineSvg,
                    title: "Data",
                  ),
                  quickActionCard(
                    colorScheme,
                    controller.goToElectricity,
                    svgIcon: Assets.electricBoltOutlineSvg,
                    title: "Electricity",
                  ),
                ],
              ),
              kSizedBox,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.showTransactionHistoryModalSheet(
                        context,
                        media,
                      );
                    },
                    child: Text(
                      "View all",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              kSmallSizedBox,
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      width: .4,
                      color: colorScheme.inversePrimary.withOpacity(.4),
                    ),
                  ),
                ),
                height: 320,
                width: media.width,
                child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) => kHalfSizedBox,
                  itemBuilder: (context, index) {
                    return recentTransaction(
                      media,
                      colorScheme,
                      () {},
                      title: "Alonso Diobi",
                      dateTime: DateTime.now(),
                      amount: 29000,
                      isSuccessful: true,
                      isIncome: true,
                      isCancelled: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
