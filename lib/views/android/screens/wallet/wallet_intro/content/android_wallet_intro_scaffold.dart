import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/wallet_intro_controller.dart';
import 'android_wallet_intro_page_1.dart';
import 'android_wallet_intro_page_2.dart';
import 'android_wallet_intro_page_3.dart';

class AndroidWalletIntroScaffold extends GetView<WalletIntroController> {
  const AndroidWalletIntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    return WillPopScope(
      onWillPop: controller.handleBackNavigation,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            androidWalletIntroPage1(colorScheme, controller),
            androidWalletIntroPage2(colorScheme, media, controller),
            androidWalletIntroPage3(context, colorScheme, media, controller),
          ],
        ),
      ),
    );
  }
}
