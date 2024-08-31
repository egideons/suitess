import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/controllers/app/wallet_information_controller.dart';
import '../../../../../../../theme/colors.dart';
import '../../content/personal_wallet_info.dart';

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
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
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
                physics: const BouncingScrollPhysics(),
                children: [
                  personalWalletInfo(media, colorScheme),
                  kSizedBox,
                  Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
