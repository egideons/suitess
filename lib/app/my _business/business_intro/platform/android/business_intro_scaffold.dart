import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/business_intro_controller.dart';
import '../../content/business_intro_page_1.dart';
import '../../content/business_intro_page_2.dart';
import '../../content/business_intro_page_3.dart';

class BusinessIntroScaffold extends GetView<BusinessIntroController> {
  const BusinessIntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          businessIntroPage1(colorScheme, controller),
          businessIntroPage2(media, colorScheme, controller),
          businessIntroPage3(colorScheme, controller),
        ],
      ),
    );
  }
}
