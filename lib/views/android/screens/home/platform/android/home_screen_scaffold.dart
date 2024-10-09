import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/auth/user_controller.dart';
import '../../../../../../controllers/app/home_screen_controller.dart';
import '../../../../../../routes/routes.dart';
import '../../content/sliver_search_app_bar.dart';
import '../../content/sliver_typewriter_app_bar.dart';
import 'components/alert_message.dart';
import 'components/filter_properties_nearby.dart';
import 'components/home_app_bar.dart';
import 'components/property_container.dart';

class HomeScreenScaffold extends GetView<HomeScreenController> {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;

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
        user!.settings!.address!,
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
            child: GetBuilder<HomeScreenController>(
              init: HomeScreenController(),
              builder: (controller) {
                return CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    sliverTypWriterTextAppBar(),
                    sliverHomeSearchAppBar(colorScheme, controller, media),
                    SliverToBoxAdapter(
                      child: Skeletonizer(
                        enabled: controller.isRefreshing.value,
                        enableSwitchAnimation: true,
                        ignoreContainers: true,
                        justifyMultiLineText: true,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.isKYCVerified.value
                                  ? messageAlertAndroid(
                                      media,
                                      message: "KYC not verified",
                                    )
                                  : const SizedBox(),
                              // kHalfSizedBox,
                              // numberOfBids(
                              //   media,
                              //   colorScheme,
                              //   viewAll: controller.goToBids,
                              // ),
                              // kSizedBox,
                              filterPropertiesNearby(
                                () {},
                                colorScheme,
                              ),
                              kSizedBox,
                              SizedBox(
                                height: 30,
                                child: ListView.separated(
                                  itemCount:
                                      controller.propertyCategories.length,
                                  separatorBuilder: (context, index) =>
                                      kHalfWidthSizedBox,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        controller
                                            .selectPropertyCategory(index);
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        padding: const EdgeInsets.all(5),
                                        decoration: ShapeDecoration(
                                          color: controller
                                                  .propertyCategories[index]
                                                  .isSelected
                                              ? colorScheme.secondary
                                                  .withOpacity(.4)
                                              : colorScheme.surface,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Text(
                                          controller
                                              .propertyCategories[index].name,
                                          style: defaultTextStyle(
                                            fontSize: 12,
                                            color: controller
                                                    .propertyCategories[index]
                                                    .isSelected
                                                ? colorScheme.secondary
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
                                    propertyLocation:
                                        "Independence layout, Enugu",
                                    propertyPrice: 350000,
                                    propertyPaymentFreq: "month",
                                    numOfBeds: 4,
                                    numOfBaths: 2,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
