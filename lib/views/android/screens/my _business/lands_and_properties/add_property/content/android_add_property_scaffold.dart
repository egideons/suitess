import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/add_property_controller.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/buttons/android/android_outlined_button.dart';
import 'package:suitess/utils/components/my_app_bar.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/add_property/content/android_add_property_form.dart';

import '../../../../../../../constants/consts.dart';

class AndroidAddPropertyScaffold extends GetView<AddPropertyController> {
  const AndroidAddPropertyScaffold({super.key});

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
                backgroundColor: colorScheme.secondary,
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
              androidAddPropertyForm(colorScheme, media, controller),
              kSizedBox,
              AndroidOutlinedButton(
                  title: "Cancel",
                  borderColor: colorScheme.secondary,
                  textColor: colorScheme.secondary,
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
