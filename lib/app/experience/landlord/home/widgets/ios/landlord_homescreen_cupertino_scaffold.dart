import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';
import 'package:kribb/src/utils/containers/page_background.dart';
import 'package:kribb/theme/colors.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/controllers/landlord_homescreen_controller.dart';
import '../../../../../../src/utils/components/circle_avatar_image.dart';
import 'utils/landlord_homescreen_cupertino_navbar.dart';

class LandLordHomeScreenCupertinoScaffold extends StatelessWidget {
  const LandLordHomeScreenCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandlordHomescreenController.instance;

    return CupertinoPageScaffold(
      navigationBar: landLordHomeScreenCupertinoNavBar(
        colorScheme,
        media,
        location: "Enugu, Nigeria",
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            child: Stack(
              children: [
                Positioned(
                  bottom: -media.height * .6,
                  child: pageBackground(media, colorScheme),
                ),
                ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    TypeWriterText.builder(
                      " ease.",
                      play: true,
                      duration: const Duration(milliseconds: 100),
                      builder: (context, value) {
                        return SizedBox(
                          width: media.width / 3,
                          child: Text.rich(
                            TextSpan(
                              text: "Manage your \nproperties with",
                              style: defaultTextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              children: [
                                TextSpan(
                                  text: value,
                                  style: defaultTextStyle(
                                    color: kAccentColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      child: CupertinoSearchTextField(
                        controller: controller.searchController,
                        placeholder: "Tap to explore",
                        placeholderStyle: defaultTextStyle(
                          color: colorScheme.inversePrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.isKYCVerified.value
                          ? const SizedBox(height: kDefaultPadding * 2)
                          : kSizedBox,
                    ),
                    Obx(
                      () => controller.isKYCVerified.value
                          ? messageAlertNav(media)
                          : const SizedBox(),
                    ),
                    Obx(
                      () => controller.isKYCVerified.value
                          ? const SizedBox(height: kDefaultPadding * 2)
                          : const SizedBox(),
                    ),
                    Obx(() => controller.availableAgentsIsVisible.value
                        ? SizedBox(
                            height: media.height * .2,
                            width: media.width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 10,
                              separatorBuilder: (context, index) =>
                                  kHalfWidthSizedBox,
                              itemBuilder: (context, index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: kGreenCardColor.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: CupertinoButton(
                                          onPressed:
                                              controller.hideAvailableAgents,
                                          padding: const EdgeInsets.all(0),
                                          alignment: Alignment.centerRight,
                                          minSize: media.height * .04,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child:
                                              const Icon(Iconsax.close_circle),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          circleAvatarImage(
                                            colorScheme,
                                          ),
                                          kHalfWidthSizedBox,
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: media.width - 150,
                                                child: Text(
                                                  "Mr Tunde Edward",
                                                  style: defaultTextStyle(
                                                    color: colorScheme.primary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: media.width - 150,
                                                child: Text(
                                                  "Agent",
                                                  style: defaultTextStyle(
                                                    color: colorScheme
                                                        .inversePrimary,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          CupertinoButton(
                                            onPressed: () {},
                                            padding: const EdgeInsets.all(0),
                                            alignment: Alignment.centerRight,
                                            // minSize: media.height * .028,
                                            child: Icon(
                                              Iconsax.arrow_right,
                                              color: colorScheme.primary,
                                              size: 28,
                                            ),
                                          ),
                                        ],
                                      ),
                                      kSizedBox,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: ShapeDecoration(
                                          color:
                                              kGreenCardColor.withOpacity(0.2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            circleAvatarImage(
                                              colorScheme,
                                              foregroundImage: const AssetImage(
                                                Assets.buildings,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      kSizedBox,
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : availableAgents(
                            media,
                            onPressed: controller.showAvailableAgents,
                          )),
                    kSizedBox,
                    Obx(
                      () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: media.width * .3,
                              child: Text(
                                "Your properties",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: defaultTextStyle(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            controller.hasProperties.value
                                ? addPropertyButton()
                                : const SizedBox(),
                          ],
                        );
                      },
                    ),
                    kSizedBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.cloud_remove,
                          size: media.height * .12,
                          color: colorScheme.inversePrimary,
                        ),
                        kSizedBox,
                        SizedBox(
                          width: media.width - 150,
                          child: Text(
                            "No properties yet",
                            textAlign: TextAlign.center,
                            style: defaultTextStyle(
                              color: colorScheme.inversePrimary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.90,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addPropertyButton({onPressed}) {
    return CupertinoButton(
      onPressed: onPressed ?? () {},
      padding: const EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: kGreenCardColor.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.add,
              color: kGreenCardColor,
            ),
            Text(
              "Add property",
              style: defaultTextStyle(
                color: kGreenCardColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget availableAgents(media, {onPressed}) {
    return CupertinoButton(
      onPressed: onPressed ?? () {},
      padding: const EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: media.width,
        height: media.height * .09,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          color: kGreenCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: kGreenCardColor.withOpacity(0.4),
              offset: const Offset(0, -20),
              spreadRadius: -10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: kLightBackgroundColor.withOpacity(0.4),
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Icon(
                  Iconsax.profile_2user5,
                  color: kLightBackgroundColor,
                ),
              ),
            ),
            kHalfWidthSizedBox,
            SizedBox(
              width: media.width * .09,
              child: Text(
                intFormattedText(57),
                style: defaultTextStyle(
                  color: kTextWhiteColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0,
                ),
              ),
            ),
            kHalfWidthSizedBox,
            SizedBox(
              width: media.width * .5,
              child: Text(
                "Agents \nare available right now!",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: defaultTextStyle(
                  color: kTextWhiteColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageAlertNav(media, {onPressed}) {
    return CupertinoButton(
      onPressed: onPressed ?? () {},
      padding: const EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: media.width,
        height: media.height * .066,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          color: kRedCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KYC not verified",
              style: defaultTextStyle(
                color: kErrorColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Iconsax.arrow_right_3, color: kErrorColor),
          ],
        ),
      ),
    );
  }
}
