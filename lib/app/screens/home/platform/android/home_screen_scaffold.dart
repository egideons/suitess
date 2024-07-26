import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/theme/colors.dart';
import 'package:typewritertext/v3/typewriter.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/homescreen_controller.dart';
import '../../../../../src/routes/routes.dart';
import 'components/alert_message.dart';
import 'components/app_bar.dart';
import 'components/filter_properties_nearby.dart';
import 'components/number_of_bids.dart';
import 'components/property_container.dart';

class HomeScreenScaffold extends GetView<HomeScreenController> {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // if (deviceType(media.width) > 2) {
    //   return Scaffold(
    //     backgroundColor: colorScheme.surface,
    //     appBar: homeAppBar(
    //       colorScheme,
    //       media,
    //       "Enugu, Nigeria.",
    //       goToNotifications: () {
    //         Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
    //       },
    //     ),
    //     body: SafeArea(
    //       child: ListView(
    //         padding: const EdgeInsets.all(10),
    //         children: const [],
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: homeAppBar(
        colorScheme,
        media,
        "Enugu, Nigeria.",
        goToNotifications: () {
          Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
        },
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
            controller: controller.scrollController,
            child: GetBuilder<HomeScreenController>(
              init: HomeScreenController(),
              builder: (controller) {
                return ListView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(10),
                  children: [
                    TypeWriter.text(
                      "Manage your \nproperties with ease",
                      style: defaultTextStyle(
                        color: kTextBoldHeadingColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      duration: const Duration(milliseconds: 100),
                    ),
                    kSizedBox,
                    InkWell(
                      onTap: controller.goToSearchScreen,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: media.width,
                        height: media.height * 0.06,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: ShapeDecoration(
                          color: kTransparentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: colorScheme.primary, width: 0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.searchOutlineSvg),
                            kHalfWidthSizedBox,
                            Text(
                              "Search",
                              style: defaultTextStyle(
                                color: colorScheme.inversePrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    kHalfSizedBox,
                    controller.isKYCVerified.value
                        ? messageAlertAndroid(
                            media,
                            message: "KYC not verified",
                          )
                        : const SizedBox(),
                    kHalfSizedBox,
                    numberOfBids(
                      media,
                      viewAll: controller.goToBids,
                    ),
                    kSizedBox,
                    filterPropertiesNearby(
                      () {},
                      colorScheme,
                    ),
                    kSizedBox,
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        itemCount: controller.propertyCategories.length,
                        separatorBuilder: (context, index) =>
                            kHalfWidthSizedBox,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectPropertyCategory(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              padding: const EdgeInsets.all(5),
                              decoration: ShapeDecoration(
                                color: controller
                                        .propertyCategories[index].isSelected
                                    ? kAccentColor.withOpacity(.4)
                                    : colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                controller.propertyCategories[index].name,
                                style: defaultTextStyle(
                                  fontSize: 12,
                                  color: controller
                                          .propertyCategories[index].isSelected
                                      ? kAccentColor
                                      : colorScheme.inversePrimary,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kSizedBox,
                    ListView.separated(
                      itemCount: 10,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return kSizedBox;
                      },
                      itemBuilder: (context, index) {
                        return propertyContainer(
                          media,
                          colorScheme,
                          nav: () {
                            Get.toNamed(
                              Routes.viewProperty,
                              preventDuplicates: true,
                            );
                          },
                          propertyImage: Assets.house1Png,
                          tradeType: "sale",
                          propertyName: "4 Flats Woodland Apartment",
                          propertyLocation: "Independence layout, Enugu",
                          propertyPrice: 350000,
                          propertyPaymentFreq: "month",
                          numOfBeds: 4,
                          numOfBaths: 2,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
