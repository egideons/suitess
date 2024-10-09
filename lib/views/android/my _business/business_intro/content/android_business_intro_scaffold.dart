import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/my%20_business/business_intro/content/android_business_intro_page_1.dart';
import 'package:suitess/app/android/my%20_business/business_intro/content/android_business_intro_page_2.dart';
import 'package:suitess/app/android/my%20_business/business_intro/content/android_business_intro_page_3.dart';

import '../../../../../src/controllers/app/business_intro_controller.dart';

class AndroidBusinessIntroScaffold extends GetView<BusinessIntroController> {
  const AndroidBusinessIntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return WillPopScope(
      onWillPop: controller.handleBackNavigation,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            androidBusinessIntroPage1(colorScheme, controller),
            androidBusinessIntroPage2(media, colorScheme, controller),
            androidBusinessIntroPage3(media, colorScheme, controller),
          ],
        ),
      ),
    );
  }
}
