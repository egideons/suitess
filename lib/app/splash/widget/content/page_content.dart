import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

Widget pageContent(media) {
  return Container(
    height: media.height,
    width: media.width,
    decoration: BoxDecoration(
      color: kDarkBackgroundColor,
      image: const DecorationImage(
        image: AssetImage(Assets.darkBackground),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: media.height / 4,
          width: media.width / 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.appLogo),
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        LoadingAnimationWidget.staggeredDotsWave(
          color: kInversePrimaryColor,
          size: 50,
        ),
      ],
    ),
  );
}
