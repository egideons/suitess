import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/add_property/content/add_property_form.dart';
import 'package:suitess/src/controllers/app/add_property_controller.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/buttons/android/android_outlined_button.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/constants/consts.dart';

class AddPropertyScaffold extends GetView<AddPropertyController> {
  const AddPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Add Property"),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: kAccentColor,
                foregroundColor: kWhiteBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              addPropertyForm(colorScheme, media, controller),
              kSizedBox,
              AndroidOutlinedButton(
                  title: "Cancel",
                  borderColor: kAccentColor,
                  textColor: kAccentColor,
                  borderWidth: 1,
                  onPressed: () {
                    Get.back();
                  }),
              kHalfSizedBox,
              Obx(() {
                return AndroidElevatedButton(
                  title: "Next",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.submitForm,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
