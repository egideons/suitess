// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          SizedBox(
            height: media.height,
            width: media.width,
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
                SpinKitChasingDots(
                  color: kInversePrimaryColor,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
