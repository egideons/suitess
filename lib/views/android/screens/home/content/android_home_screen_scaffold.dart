import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/views/android/screens/home/content/android_properties_nearby_list.dart';

import '../../../../../constants/consts.dart';
import '../../../../../controllers/app/home_screen_controller.dart';
import '../../../../../controllers/auth/user_controller.dart';
import '../../../../../routes/routes.dart';
import '../components/android_filter_properties_nearby.dart';
import '../components/android_home_app_bar.dart';
import '../components/android_property_container.dart';
import 'android_sliver_search_app_bar.dart';
import 'android_sliver_typewriter_app_bar.dart';

class AndroidHomeScreenScaffold extends GetView<HomeScreenController> {
  const AndroidHomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidHomeAppBar(
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
                    androidSliverTypeWriterTextAppBar(),
                    androidSliverHomeSearchAppBar(
                      colorScheme,
                      controller,
                      media,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: androidFilterPropertiesNearby(
                              () {},
                              colorScheme,
                            ),
                          ),
                          kSizedBox,
                          Skeletonizer(
                            enabled: controller.isRefreshing.value,
                            enableSwitchAnimation: true,
                            ignoreContainers: true,
                            justifyMultiLineText: true,
                            child:
                                propertiesNearbyList(controller, colorScheme),
                          ),
                          kSizedBox,
                        ],
                      ),
                    ),
                    SliverList.separated(
                      itemCount: 20,
                      separatorBuilder: (context, index) => kSizedBox,
                      itemBuilder: (context, index) {
                        return Skeletonizer(
                          enabled: controller.isRefreshing.value,
                          enableSwitchAnimation: true,
                          ignoreContainers: true,
                          justifyMultiLineText: true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: androidPropertyContainer(
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
                            ),
                          ),
                        );
                      },
                    ),

                    // SliverToBoxAdapter(
                    //   child: Skeletonizer(
                    //     enabled: controller.isRefreshing.value,
                    //     enableSwitchAnimation: true,
                    //     ignoreContainers: true,
                    //     justifyMultiLineText: true,
                    //     child: SingleChildScrollView(
                    //       padding: const EdgeInsets.all(10),
                    //       physics: const BouncingScrollPhysics(),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           controller.isKYCVerified.value
                    //               ? androidMessageAlert(
                    //                   media,
                    //                   message: "KYC not verified",
                    //                 )
                    //               : const SizedBox(),
                    //           // kHalfSizedBox,
                    //           // androidNumberOfBids(
                    //           //   media,
                    //           //   colorScheme,
                    //           //   viewAll: controller.goToBids,
                    //           // ),
                    //           // kSizedBox,
                    //           androidFilterPropertiesNearby(
                    //             () {},
                    //             colorScheme,
                    //           ),
                    //           kSizedBox,
                    //           SizedBox(
                    //             height: 30,
                    //             child: ListView.separated(
                    //               itemCount:
                    //                   controller.propertyCategories.length,
                    //               separatorBuilder: (context, index) =>
                    //                   kHalfWidthSizedBox,
                    //               scrollDirection: Axis.horizontal,
                    //               itemBuilder: (context, index) {
                    //                 return InkWell(
                    //                   onTap: () {
                    //                     controller
                    //                         .selectPropertyCategory(index);
                    //                   },
                    //                   child: AnimatedContainer(
                    //                     duration:
                    //                         const Duration(milliseconds: 300),
                    //                     curve: Curves.easeInOut,
                    //                     padding: const EdgeInsets.all(5),
                    //                     decoration: ShapeDecoration(
                    //                       color: controller
                    //                               .propertyCategories[index]
                    //                               .isSelected
                    //                           ? colorScheme.secondary
                    //                               .withOpacity(.4)
                    //                           : colorScheme.surface,
                    //                       shape: RoundedRectangleBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(4),
                    //                       ),
                    //                     ),
                    //                     child: Text(
                    //                       controller
                    //                           .propertyCategories[index].name,
                    //                       style: defaultTextStyle(
                    //                         fontSize: 12,
                    //                         color: controller
                    //                                 .propertyCategories[index]
                    //                                 .isSelected
                    //                             ? colorScheme.secondary
                    //                             : colorScheme.inversePrimary,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //             ),
                    //           ),
                    //           kSizedBox,
                    //           ListView.separated(
                    //             itemCount: 10,
                    //             physics: const BouncingScrollPhysics(),
                    //             scrollDirection: Axis.vertical,
                    //             shrinkWrap: true,
                    //             separatorBuilder: (context, index) =>
                    //               kSizedBox,
                    //             itemBuilder: (context, index) {
                    //               return androidPropertyContainer(
                    //                 media,
                    //                 colorScheme,
                    //                 nav: () {
                    //                   Get.toNamed(
                    //                     Routes.viewProperty,
                    //                     preventDuplicates: true,
                    //                   );
                    //                 },
                    //                 propertyImage: Assets.house1Png,
                    //                 tradeType: "sale",
                    //                 propertyName: "4 Flats Woodland Apartment",
                    //                 propertyLocation:
                    //                     "Independence layout, Enugu",
                    //                 propertyPrice: 350000,
                    //                 propertyPaymentFreq: "month",
                    //                 numOfBeds: 4,
                    //                 numOfBaths: 2,
                    //               );
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
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
