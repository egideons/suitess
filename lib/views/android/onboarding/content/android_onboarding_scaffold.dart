import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/onboarding/content/android_onboarding_page_content.dart';

import '../../../../controllers/others/onboarding_controller.dart';

class AndroidOnboardingScaffold extends GetView<OnboardingController> {
  const AndroidOnboardingScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(toolbarHeight: media.height * .004),
      body: SafeArea(
        child: androidOnboardingPageContent(
          media: media,
          colorScheme: colorScheme,
          controller: controller,
        ),
      ),
    );
  }
}
