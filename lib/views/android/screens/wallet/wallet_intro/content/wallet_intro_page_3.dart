import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/wallet_intro_controller.dart';
import 'package:suitess/views/android/screens/wallet/wallet_intro/content/wallet_intro_page_3_form.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';

walletIntroPage3(
  BuildContext context,
  ColorScheme colorScheme,
  Size media,
  WalletIntroController controller,
) {
  return GetBuilder<WalletIntroController>(
    init: WalletIntroController(),
    builder: (controller) {
      return Column(
        children: [
          kBigSizedBox,
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: controller.goBackToPage1,
              icon: const Icon(Icons.chevron_left),
              tooltip: "Go back",
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
                        "Setup Transaction Pin",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kHalfSizedBox,
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
                SizedBox(height: media.height * .12),
                FadeInUp(
                  child: walletIntroPage3Form(
                    controller,
                    colorScheme,
                    media,
                    context,
                  ),
                ),
                kSizedBox,
                FadeIn(
                  child: Obx(
                    () => AndroidElevatedButton(
                      title: "Submit",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.submitTXPIN,
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
