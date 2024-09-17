import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/properties_home/content/lands_and_properties_app_bar.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/lands_and_properties_controller.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';

import '../../../../../../theme/colors.dart';
import '../../content/verify_account_container.dart';

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
                              verifyAccountContainer(controller),
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
