import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../../../../../../src/utils/components/my_app_bar.dart';
import '../../../../../../theme/colors.dart';

class WalletTransferScaffold extends GetView<WalletTransferController> {
  const WalletTransferScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Transfer",
        actions: [],
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
    );
  }
}
