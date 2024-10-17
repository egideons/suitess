import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../../controllers/app/wallet_information_controller.dart';
import '../../../../../../../theme/colors.dart';
import 'personal_wallet_info.dart';
import 'wallet_tier_info.dart';

class WalletInformationScaffold extends GetView<WalletInformationController> {
  const WalletInformationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = WalletInformationController.instance;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Wallet Information"),
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
          child: GetBuilder<WalletInformationController>(
            init: WalletInformationController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                children: [
                  personalWalletInfo(media, colorScheme),
                  kSizedBox,
                  walletTierInfo(
                    colorScheme,
                    controller,
                    isCurrentTier: true,
                    tierType: "Tier 1",
                    maxSingleTransfer: "50k",
                    dailyTransactionLimit: "200k",
                    maximumAccountBalance: "1m",
                  ),
                  kSizedBox,
                  walletTierInfo(
                    colorScheme,
                    controller,
                    isCurrentTier: false,
                    tierType: "Tier 2",
                    maxSingleTransfer: "1m",
                    dailyTransactionLimit: "5m",
                    maximumAccountBalance: "20m",
                  ),
                  kSizedBox,
                  walletTierInfo(
                    colorScheme,
                    controller,
                    isCurrentTier: false,
                    tierType: "Tier 3",
                    maxSingleTransfer: "5m",
                    dailyTransactionLimit: "25m",
                    maximumAccountBalance: "Unlimited",
                  ),
                  kSizedBox,
                  walletTierInfo(
                    colorScheme,
                    controller,
                    isCurrentTier: false,
                    tierType: "Business Wallet",
                    maxSingleTransfer: "5m",
                    dailyTransactionLimit: "25m",
                    maximumAccountBalance: "Unlimited",
                  ),
                  kSizedBox,
                  AndroidElevatedButton(
                    title: "Upgrade to Tier 2",
                    onPressed: () {},
                  ),
                  kSizedBox,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
