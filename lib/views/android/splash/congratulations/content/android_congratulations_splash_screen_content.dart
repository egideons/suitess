import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';

androidCongratulationsSplashScreenContent(Size media, ColorScheme colorScheme) {
  return Container(
    height: media.height,
    width: media.width,
    decoration: BoxDecoration(
      color: colorScheme.surface,
      image: DecorationImage(
        image: AssetImage(
          Get.isDarkMode ? Assets.darkBackground : Assets.lightBackground,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(Assets.badge, animate: true, fit: BoxFit.contain),
        const SizedBox(height: kDefaultPadding * 4),
        SizedBox(
          height: media.height * .3,
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  "Congratulations!!\nYou have finished setting up your profile.",
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  style: defaultTextStyle(
                    fontSize: 24.0,
                    color: colorScheme.secondary,
                  ),
                ),
              ),
              Positioned(
                child: Center(
                  child: Lottie.asset(Assets.colorSplash, animate: true),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
