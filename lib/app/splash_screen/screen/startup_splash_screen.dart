// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: media.height,
              width: media.width,
              decoration: BoxDecoration(
                color: kDarkBackgroundColor,
                image: const DecorationImage(
                  image: AssetImage(Assets.backgroundImage),
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
            ),
          ],
        ),
      ),
    );
  }
}
