import 'package:flutter/cupertino.dart';
import 'package:kribb/app/onboarding/controllers/onboarding_page_controller.dart';

import '../../../../src/constants/assets.dart';

class CupertinoOnboardingScaffold extends StatelessWidget {
  final OnboardingController controller;
  const CupertinoOnboardingScaffold({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: PageView.builder(
        controller: controller.pageController.value,
        itemCount: controller.onboardController.value.items.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                top: -media.height / 2.6,
                left: media.width - 370,
                child: Container(
                  height: media.height / 2,
                  width: media.width - 120,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(Assets.testImage),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      opacity: 0.4,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: media.height / 6.6,
                left: media.width - 364,
                child: Container(
                  height: media.height / 2,
                  width: media.width - 120,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(Assets.testImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
