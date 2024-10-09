import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/business_intro_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';

androidBusinessIntroPage1(
  ColorScheme colorScheme,
  BusinessIntroController controller,
) {
  return Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(color: kGreenFrameBackgroundColor),
          child: Center(
            child: FadeInDown(
              child: SvgPicture.asset(
                Assets.briefcaseDollarFilledSvg,
                color: colorScheme.secondary,
                height: 120,
                width: 120,
              ),
            ),
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
                "Ready to Start Your Business?",
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kSizedBox,
              Text(
                "Create your business with us today and start managing hotels, advertising, and selling lands and properties.",
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
                title: "Get Started",
                onPressed: controller.navigateToPage2,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
