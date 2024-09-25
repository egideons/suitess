import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/wallet_intro_controller.dart';
import '../../content/wallet_intro_page_1.dart';
import '../../content/wallet_intro_page_2.dart';
import '../../content/wallet_intro_page_3.dart';

class WalletIntroScaffold extends GetView<WalletIntroController> {
  const WalletIntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          walletIntroPage1(colorScheme, controller),
          walletIntroPage2(colorScheme, media, controller),
          walletIntroPage3(colorScheme, media, controller),
        ],
      ),
    );
  }
}
