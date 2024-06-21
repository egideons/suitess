import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/theme/colors.dart';
import 'package:typewritertext/v3/typewriter.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/homescreen_controller.dart';
import '../../../../../src/routes/routes.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import 'components/alert_message.dart';
import 'components/app_bar.dart';
import 'components/filter_properties_nearby.dart';
import 'components/number_of_bids.dart';

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = HomescreenController.instance;

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
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.primary,
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<HomescreenController>(
              init: HomescreenController(),
              builder: (controller) {
                return ListView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(10),
                  children: [
                    TypeWriter.text(
                      "Manage your \nproperties with ease",
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      duration: const Duration(milliseconds: 100),
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      child: CupertinoSearchTextField(
                        autocorrect: true,
                        backgroundColor: colorScheme.surface,
                        enableIMEPersonalizedLearning: true,
                        controller: controller.searchController,
                        placeholder: "Search",
                        placeholderStyle: defaultTextStyle(
                          color: colorScheme.primary.withOpacity(.5),
                          fontWeight: FontWeight.normal,
                        ),
                        onSubmitted: (value) {},
                        onChanged: (value) {},
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
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: SvgPicture.asset(
                                Assets.house2Svg,
                                fit: BoxFit.contain,
                                height: media.height * .4,
                                width: media.width,
                              ),
                            ),
                          ],
                        ),
                      ],
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
