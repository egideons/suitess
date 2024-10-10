import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/lands_and_properties_controller.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/properties_home/content/android_lands_and_properties_app_bar.dart';

import '../../../../../../../theme/colors.dart';
import 'android_verify_account_container.dart';

class AndroidLandsAndPropertiesScaffold
    extends GetView<LandsAndPropertiesController> {
  const AndroidLandsAndPropertiesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidLandsAndPropertiesAppBar(
        colorScheme,
        media,
        "Enugu, Nigeria",
        controller,
      ),
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
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.inversePrimary,
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Obx(
                  () {
                    return controller.verifyAccountBannerIsVisible.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              androidVerifyAccountContainer(
                                  controller, colorScheme),
                              kBigSizedBox,
                            ],
                          )
                        : const SizedBox();
                  },
                ),
                Text(
                  "My Properties",
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kSizedBox,
                GetBuilder<LandsAndPropertiesController>(
                  init: LandsAndPropertiesController(),
                  builder: (controller) {
                    return controller.hasProperties.value == false
                        ? Column(
                            children: [
                              SvgPicture.asset(Assets.cloudOffFilledSvg),
                              kHalfSizedBox,
                              Text(
                                "No properties yet",
                                style: defaultTextStyle(
                                  color: kTextBoldHeadingColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              kHalfSizedBox,
                              Text(
                                "Your listed properties would appear here.\nClick “add property” to start listing.",
                                textAlign: TextAlign.center,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              kBigSizedBox,
                              AndroidElevatedButton(
                                title: "Add property",
                                onPressed: controller.addProperty,
                                isRowVisible: true,
                                isSwitched: true,
                                mainAxisAlignment: MainAxisAlignment.center,
                                buttonIcon: Icons.add,
                                buttonIconColor: kWhiteBackgroundColor,
                              ),
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
