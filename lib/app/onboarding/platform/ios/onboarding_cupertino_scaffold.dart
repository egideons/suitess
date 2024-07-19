import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../src/controllers/others/onboarding_controller.dart';
import '../../content/onboarding_cupertino_page_content.dart';

class OnboardingCupertinoScaffold extends StatelessWidget {
  const OnboardingCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final controller = OnboardingController.instance;

    return CupertinoPageScaffold(
      child: onboardingCupertinoPageContent(
        media: media,
        colorScheme: colorScheme,
        controller: controller,
      ),
    );
  }
}
