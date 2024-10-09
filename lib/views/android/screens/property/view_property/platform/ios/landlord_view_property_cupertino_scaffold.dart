import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/view_property_controller.dart';
import '../../../../../../../utils/buttons/ios/scroll_to_top_cupertino_button.dart';
import 'utils/view_property_cupertino_edit_button.dart';
import 'utils/view_property_cupertino_navbar.dart';

class ViewPropertyCupertinoScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = ViewPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: viewPropertyCupertinoNavBar(
        colorScheme,
        media,
        previousPageTitle: "Back",
        deleteFunction: () {},
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            controller: controller.scrollController,
            child: Stack(
              children: [
                GetBuilder<ViewPropertyController>(
                  init: ViewPropertyController(),
                  builder: (controller) {
                    return ListView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      children: [
                        Text(
                          "631 Akpos Celina Avenue, Matic lane, Enugu state.",
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        kSizedBox,
                        Text(
                          "Description",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        kHalfSizedBox,
                        Text(
                          "More information and features",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        kHalfSizedBox,
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: kSuccessColor,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: media.width / 1.4,
                                  child: Text(
                                    "Parking space availability",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: defaultTextStyle(
                                      color: colorScheme.inversePrimary,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      letterSpacing: .1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        kSizedBox,
                        viewPropertyEditCupertinoButton(
                          colorScheme,
                          media,
                          priceOfProperty: 350000,
                          paymentFrequency: "year",
                          editProperty: () {},
                        ),
                        kSizedBox,
                      ],
                    );
                  },
                ),
                kSizedBox,
                Obx(
                  () => controller.isScrollToTopBtnVisible.value
                      ? Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: scrollToTopCupertinoButton(controller),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
