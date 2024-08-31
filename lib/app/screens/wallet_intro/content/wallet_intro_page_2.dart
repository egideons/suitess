import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/app/wallet_intro_controller.dart';
import '../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../theme/colors.dart';
import 'wallet_intro_page_2_form.dart';

walletIntroPage2(
    ColorScheme colorScheme, Size media, WalletIntroController controller) {
  return ListView(
    padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
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
        child: GetBuilder<WalletIntroController>(
          init: WalletIntroController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: walletIntroPage2Form(colorScheme, media, controller),
            );
          },
        ),
      ),
      Obx(
        () {
          if (controller.tableCalendarIsVisible.value) {
            return FadeIn(
              child: AndroidElevatedButton(
                title: "Select Date",
                onPressed: controller.submitSelectedDoB,
              ),
            );
          } else {
            return FadeIn(
              child: AndroidElevatedButton(
                title: "Submit",
                isLoading: controller.isLoading.value,
                onPressed: controller.submitForm,
              ),
            );
          }
        },
      ),
    ],
  );
}
