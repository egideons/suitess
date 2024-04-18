import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kribb/app/onboarding/controllers/onboarding_page_controller.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/theme/colors.dart';

class CupertinoOnboardingScaffold extends StatelessWidget {
  final OnboardingController controller;
  const CupertinoOnboardingScaffold({
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
        physics: const NeverScrollableScrollPhysics(),
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
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: kLightGreyColor,
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
                                    fontSize: 14.0,
                                  ),
                                ),
                                kHalfWidthSizedBox,
                                const FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 10,
                                )
                              ],
                            ),
                          ),
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
