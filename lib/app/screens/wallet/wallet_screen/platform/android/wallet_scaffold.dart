import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/circle_avatar_image.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../src/controllers/app/wallet_screen_controller.dart';
import '../../../../../../src/utils/components/notification_bell_icon.dart';
import '../../../../../../theme/colors.dart';
import '../../content/add_ink_well.dart';
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
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
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
                    controller,
                    walletBalance: "2,372,054.02",
                    acctNumber: "0059908243",
                    bvn: "22239350048",
                  ),
                  kSmallWidthSizedBox,
                  addInkWell(colorScheme, () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
