import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/wallet_intro_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';

androidWalletIntroPage1(
    ColorScheme colorScheme, WalletIntroController controller) {
  return Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(color: kGreenFrameBackgroundColor),
          child: Center(
            child: FadeInDown(child: SvgPicture.asset(Assets.walletIntro1Svg)),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(color: colorScheme.surface),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Finance Your Dream Property",
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kSizedBox,
              Text(
                "Manage funds, track payments, and unlock exclusive offers—all in one place.",
                maxLines: 10,
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kBigSizedBox,
              AndroidElevatedButton(
                title: "Activate Wallet",
                onPressed: controller.navigateToPage2,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
