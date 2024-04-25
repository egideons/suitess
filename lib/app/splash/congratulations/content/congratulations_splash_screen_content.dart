import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: media.height / 4,
          width: media.width / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Get.isDarkMode ? Assets.lightAppLogo : Assets.darkAppLogo,
              ),
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        LoadingAnimationWidget.staggeredDotsWave(
          color: colorScheme.primary,
          size: 50,
        ),
      ],
    ),
  );
}
