import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/signup/screen/signup.dart';
import 'package:kribb/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../theme/colors.dart';

Widget onboardingPageContent({controller, colorScheme, media}) {
  return PageView.builder(
    onPageChanged: (index) => controller.setIsLastPage(index),
    controller: controller.pageController.value,
    itemCount: controller.onboardController.value.items.length,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Stack(
        children: [
          //Top Middle
          Positioned(
            top: -media.height / 1.8,
            right: media.width / 8,
            child: Container(
              height: media.height / 1.5,
              width: media.width / 1.34,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      controller.onboardController.value.items[index].image),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  opacity: 0.4,
                ),
              ),
            ),
          ),
          //Top Left
          Positioned(
            top: -media.height / 3,
            right: media.width * .92,
            child: Container(
              height: media.height / 2,
              width: media.width - 120,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    controller.onboardController.value.items[index].image,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
            ),
          ),

          //Middle left
          Positioned(
            top: media.height * .2,
            right: media.width * .92,
            child: Container(
              height: media.height / 2,
              width: media.width - 120,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      controller.onboardController.value.items[index].image),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
            ),
          ),

          //Top Right
          Positioned(
            top: -media.height / 3,
            left: media.width * .92,
            child: Container(
              height: media.height / 2,
              width: media.width - 120,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    controller.onboardController.value.items[index].image,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
            ),
          ),

          //Middle Right
          Positioned(
            top: media.height * .2,
            left: media.width * .92,
            child: Container(
              height: media.height / 2,
              width: media.width - 120,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    controller.onboardController.value.items[index].image,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
            ),
          ),

          //Middle
          Positioned(
            top: media.height / 8,
            right: media.width / 8,
            child: Container(
              height: media.height / 1.5,
              width: media.width / 1.34,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    controller.onboardController.value.items[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Obx(
            () {
              return Positioned(
                bottom: 0,
                child: Container(
                  height: media.height / 2.5,
                  width: media.width,
                  decoration: ShapeDecoration(
                    color: colorScheme.background,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: const ShapeDecoration(
                          // color: colorScheme.inversePrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: !controller.isLastPage.value
                                    ? null
                                    : () {
                                        controller.pageController.value
                                            .animateToPage(
                                          controller.onboardController.value
                                                  .items.length -
                                              3,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                style: TextButton.styleFrom(
                                  backgroundColor: !controller.isLastPage.value
                                      ? colorScheme.background
                                      : colorScheme.inversePrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.chevronLeft,
                                      color: colorScheme.background,
                                      size: 10,
                                    ),
                                    kHalfWidthSizedBox,
                                    Text(
                                      !controller.isLastPage.value
                                          ? ""
                                          : "Back",
                                      style: defaultTextStyle(
                                        color: colorScheme.background,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: controller.isLastPage.value
                                    ? null
                                    : () {
                                        controller.pageController.value
                                            .animateToPage(
                                          controller.onboardController.value
                                                  .items.length -
                                              1,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                style: TextButton.styleFrom(
                                  backgroundColor: controller.isLastPage.value
                                      ? colorScheme.background
                                      : colorScheme.inversePrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.isLastPage.value ? "" : "Skip",
                                      style: defaultTextStyle(
                                        color: colorScheme.background,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    kHalfWidthSizedBox,
                                    FaIcon(
                                      FontAwesomeIcons.chevronRight,
                                      color: colorScheme.background,
                                      size: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: media.width - 100,
                        child: Text(
                          controller.onboardController.value.items[index].title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: colorScheme.primary,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      kSizedBox,
                      SizedBox(
                        width: media.width - 100,
                        child: Text(
                          controller
                              .onboardController.value.items[index].description,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      kSizedBox,
                      SmoothPageIndicator(
                        controller: controller.pageController.value,
                        count: controller.onboardController.value.items.length,
                        onDotClicked: (index) =>
                            controller.pageController.value.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                        effect: WormEffect(
                          spacing: 4.0,
                          radius: 10.0,
                          dotWidth: 40.0,
                          dotHeight: 5.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.0,
                          dotColor: colorScheme.inversePrimary,
                          activeDotColor: kAccentColor,
                        ),
                      ),
                      kSizedBox,
                      controller.isLastPage.value
                          ? SizedBox(
                              width: media.width - 100,
                              child: CupertinoElevatedButton(
                                title: "Get Started",
                                onPressed: () async {
                                  //Save state that the user has been onboarded
                                  prefs.setBool("isOnboarded", true);

                                  await Get.offAll(
                                    () => const Signup(),
                                    routeName: "/signup",
                                    fullscreenDialog: true,
                                    curve: Curves.easeInOut,
                                    predicate: (routes) => false,
                                    popGesture: false,
                                    transition: Get.defaultTransition,
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              width: media.width - 100,
                              child: CupertinoElevatedButton(
                                title: "Next",
                                onPressed: () {
                                  controller.pageController.value.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                            )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      );
    },
  );
}
