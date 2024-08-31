import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/wallet_intro_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/wallet_intro_page_1.dart';

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
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 80),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kSizedBox,
                      SvgPicture.asset(Assets.walletIntro2Svg),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
