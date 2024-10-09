import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/responsive_constants.dart';

import '../../../../constants/consts.dart';
import '../../../../controllers/others/onboarding_controller.dart';
import '../../../../theme/colors.dart';

onboardingAndroidPageContent({
  OnboardingController? controller,
  ColorScheme? colorScheme,
  Size? media,
}) {
  //Landscape or larger screens
  if (deviceType(media!.width) > 1) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: media.width / 2,
            child: PageView.builder(
              onPageChanged: (index) => controller.setIsLastPage(index),
              controller: controller!.imageController.value,
              itemCount: controller.onboardContent.value.items.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInLeft(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: media.height * .58,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            controller.onboardContent.value.items[index].image,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) => controller.setIsLastPage(index),
                    controller: controller.pageController.value,
                    itemCount: controller.onboardContent.value.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 100,
                              child: Text(
                                controller
                                    .onboardContent.value.items[index].title,
                                textAlign: TextAlign.center,
                                style: defaultTextStyle(
                                  color: colorScheme!.primary,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                            kHalfSizedBox,
                            SizedBox(
                              width: media.width - 100,
                              child: Text(
                                controller.onboardContent.value.items[index]
                                    .description,
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      FadeInUp(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: colorScheme!.inversePrimary),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SmoothPageIndicator(
                            controller: controller.pageController.value,
                            count: controller.onboardContent.value.items.length,
                            onDotClicked: (index) {
                              controller.imageController.value.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                              controller.pageController.value.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            effect: WormEffect(
                              spacing: 0,
                              radius: 20.0,
                              dotWidth: 40.0,
                              dotHeight: 2.5,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 1.0,
                              type: WormType.thinUnderground,
                              dotColor: colorScheme.inversePrimary,
                              activeDotColor: colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      controller.isLastPage.value
                          ? FadeInUp(
                              child: SizedBox(
                                width: media.width - 100,
                                child: AndroidElevatedButton(
                                  title: "Get Started",
                                  buttonColor: kSuccessColor,
                                  onPressed: controller.getStarted,
                                ),
                              ),
                            )
                          : FadeInUp(
                              child: SizedBox(
                                width: media.width - 100,
                                child: AndroidElevatedButton(
                                  title: "Next",
                                  buttonColor: kSuccessColor,
                                  onPressed: () {
                                    controller.imageController.value.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                    controller.pageController.value.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                ),
                              ),
                            ),
                      kHalfSizedBox,
                      controller.isLastPage.value
                          ? const SizedBox()
                          : FadeInUp(
                              child: SizedBox(
                                width: media.width - 100,
                                child: AndroidElevatedButton(
                                  title: "Skip",
                                  onPressed: controller.getStarted,
                                  buttonColor: colorScheme.surface,
                                  textColor: kSuccessColor,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//Mobile or Portrait Screen
  return Obx(
    () => Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (index) => controller.setIsLastPage(index),
            controller: controller!.pageController.value,
            itemCount: controller.onboardContent.value.items.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInDown(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // SvgPicture.asset(
                      //   controller.onboardContent.value.items[index].image,
                      //   height: media.height * .5,
                      //   fit: BoxFit.contain,
                      // ),
                      Container(
                        height: media.height * .5,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              controller
                                  .onboardContent.value.items[index].image,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      kHalfSizedBox,
                      SizedBox(
                        // width: media.width - 100,
                        child: Text(
                          controller.onboardContent.value.items[index].title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: colorScheme!.primary,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      kHalfSizedBox,
                      SizedBox(
                        width: media.width - 100,
                        child: Text(
                          controller
                              .onboardContent.value.items[index].description,
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            FadeInUp(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme!.inversePrimary),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SmoothPageIndicator(
                  controller: controller.pageController.value,
                  count: controller.onboardContent.value.items.length,
                  onDotClicked: (index) =>
                      controller.pageController.value.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  ),
                  effect: WormEffect(
                    spacing: 0,
                    radius: 20.0,
                    dotWidth: 40.0,
                    dotHeight: 2.5,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.0,
                    type: WormType.thinUnderground,
                    dotColor: colorScheme.inversePrimary,
                    activeDotColor: colorScheme.surface,
                  ),
                ),
              ),
            ),
            kSizedBox,
            controller.isLastPage.value
                ? FadeInUp(
                    child: SizedBox(
                      width: media.width - 100,
                      child: AndroidElevatedButton(
                        title: "Get Started",
                        buttonColor: kSuccessColor,
                        onPressed: controller.getStarted,
                      ),
                    ),
                  )
                : FadeInUp(
                    child: SizedBox(
                      width: media.width - 100,
                      child: AndroidElevatedButton(
                        title: "Next",
                        buttonColor: kSuccessColor,
                        onPressed: () {
                          controller.pageController.value.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                  ),
            kHalfSizedBox,
            FadeInUp(
              child: SizedBox(
                width: media.width - 100,
                child: AndroidElevatedButton(
                  title: "Skip",
                  onPressed: controller.getStarted,
                  buttonColor: colorScheme.surface,
                  textColor: kSuccessColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
