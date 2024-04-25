import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/theme/colors.dart';
import 'package:lottie/lottie.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/constants/consts.dart';

Widget congratulationsSplashScreenContent({media, colorScheme}) {
  return Container(
    height: media.height,
    width: media.width,
    decoration: BoxDecoration(
      color: colorScheme.background,
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
                  style: defaultTextStyle(
                    fontSize: 24.0,
                    color: kAccentColor,
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
