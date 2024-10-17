import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/wallet_intro_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';
import 'wallet_intro_page_2_form.dart';

walletIntroPage2(
    ColorScheme colorScheme, Size media, WalletIntroController controller) {
  return GetBuilder<WalletIntroController>(
    init: WalletIntroController(),
    builder: (controller) {
      return Column(
        children: [
          kBigSizedBox,
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: controller.goBackToPage0,
              tooltip: "Go back",
              icon: const Icon(Icons.chevron_left),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                FadeInDown(
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
                      kSizedBox,
                      Text(
                        "Suitess Wallet",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kSizedBox,
                      Text(
                        "To activate your wallet and manage your funds, provide details below.",
                        textAlign: TextAlign.center,
                        maxLines: 10,
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                kBigSizedBox,
                FadeInUp(
                  child: walletIntroPage2Form(colorScheme, media, controller),
                ),
                FadeIn(
                  child: Obx(
                    () => AndroidElevatedButton(
                      title: "Next",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.submitKYCForm,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
