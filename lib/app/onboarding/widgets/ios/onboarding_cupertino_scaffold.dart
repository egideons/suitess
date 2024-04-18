import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kribb/app/onboarding/controllers/onboarding_page_controller.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/utils/buttons/my_elevatedbutton.dart';
import 'package:kribb/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingCupertinoScaffold extends StatelessWidget {
  final OnboardingController controller;
  const OnboardingCupertinoScaffold({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      child: PageView.builder(
        controller: controller.pageController.value,
        itemCount: controller.onboardController.value.items.length,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                top: -media.height / 2.5,
                left: media.width - 380,
                child: Container(
                  height: media.height / 2,
                  width: media.width - 100,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage(controller
                          .onboardController.value.items[index].image),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      opacity: 0.4,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -media.height / 3,
                right: media.width - 30,
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
              Positioned(
                top: media.height - 750,
                right: media.width - 30,
                child: Container(
                  height: media.height / 2,
                  width: media.width - 120,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage(controller
                          .onboardController.value.items[index].image),
                      fit: BoxFit.cover,
                      opacity: 0.3,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -media.height / 3,
                left: media.width - 30,
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
              Positioned(
                top: media.height - 750,
                left: media.width - 30,
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
              Positioned(
                top: media.height / 8,
                left: media.width - 380,
                child: Container(
                  height: media.height / 2,
                  width: media.width - 100,
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
              Positioned(
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
                          // color: colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              controller.pageController.value.animateToPage(
                                controller
                                        .onboardController.value.items.length -
                                    1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: colorScheme.inversePrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Skip",
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
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.0,
                          dotColor: colorScheme.inversePrimary,
                          activeDotColor: kAccentColor,
                        ),
                      ),
                      kSizedBox,
                      SizedBox(
                        width: media.width - 100,
                        child: MyElevatedButton(
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
              )
            ],
          );
        },
      ),
    );
  }
}
