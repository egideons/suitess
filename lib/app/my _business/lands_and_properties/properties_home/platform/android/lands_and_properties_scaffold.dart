import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/properties_home/content/lands_and_properties_app_bar.dart';
import 'package:suitess/src/controllers/app/lands_and_properties_controller.dart';

import '../../../../../../theme/colors.dart';

class LandsAndPropertiesScaffold extends GetView<LandsAndPropertiesController> {
  const LandsAndPropertiesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: landsAndPropertiesAppBar(
        colorScheme,
        media,
        "Enugu, Nigeria",
        controller,
      ),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.inversePrimary,
          child: Scrollbar(
            child: ListView(
              children: [
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
