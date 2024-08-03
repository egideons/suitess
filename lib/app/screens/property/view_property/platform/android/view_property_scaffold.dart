import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/view_property_controller.dart';

import '../../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../../theme/colors.dart';
import '../../content/property_about_tab.dart';
import '../../content/property_agent_tab.dart';
import '../../content/property_app_bar.dart';
import '../../content/property_tabs.dart';

class ViewPropertyScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
      body: Scrollbar(
        controller: controller.scrollController,
        child: GetBuilder<ViewPropertyController>(
          init: ViewPropertyController(),
          builder: (controller) {
            return CustomScrollView(
              controller: controller.scrollController,
              slivers: <Widget>[
                viewPropertyAppBar(colorScheme, controller, media),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 5,
                            width: 40,
                            decoration: ShapeDecoration(
                              color: colorScheme.inversePrimary.withOpacity(.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ),
                        kSizedBox,
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            itemCount: controller.propertyTabs.length,
                            separatorBuilder: (context, index) =>
                                kHalfWidthSizedBox,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return viewPropertyTabs(
                                controller,
                                index,
                                colorScheme,
                              );
                            },
                          ),
                        ),
                        controller.propertyTabs.first.isSelected
                            ? kSizedBox
                            : kHalfSizedBox,
                        controller.propertyTabs.first.isSelected
                            ? aboutTab(colorScheme, media, controller)
                            : agentTab(colorScheme, media, controller),
                        kHalfSizedBox,
                        controller.isScrollToTopBtnVisible.value
                            ? AndroidElevatedButton(
                                title: "Book Appointment",
                                onPressed: controller.toBookAppointment,
                              )
                            : const SizedBox(),
                        kSizedBox,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
