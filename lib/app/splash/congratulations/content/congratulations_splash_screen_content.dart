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
      children: [
        Lottie.asset(
          Assets.badge,
        ),
        kSizedBox,
        SizedBox(
          height: media.height * .3,
          child: Stack(
            children: [
              Positioned(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    fontSize: 24.0,
                    color: kAccentColor,
                  ),
                  child: const Text(
                    "Congratulations!!\nYou have finished setting up your profile",
                  ),
                ),
              ),
              Positioned(
                top: -40,
                // left: media.width / 10,
                child: Lottie.asset(
                  Assets.colorSplash,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
        // LoadingAnimationWidget.staggeredDotsWave(
        //   color: colorScheme.primary,
        //   size: 50,
        // ),
      ],
    ),
  );
}
