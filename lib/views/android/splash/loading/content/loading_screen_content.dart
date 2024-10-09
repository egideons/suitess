import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';

Widget loadingScreenContent({media, colorScheme}) {
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
