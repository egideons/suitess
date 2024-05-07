import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/utils/components/circle_avatar_image.dart';
import 'package:kribb/src/utils/components/responsive_constants.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_view_property_controller.dart';
import '../../../../../../src/utils/containers/page_background.dart';

class LandLordViewPropertyCupertinoScaffold extends StatelessWidget {
  const LandLordViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordViewPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Home",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: colorScheme.background),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: ShapeDecoration(
            color: kRedCardColor,
            shape: const CircleBorder(),
          ),
          child: CupertinoButton(
            onPressed: () {},
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(100),
            padding: const EdgeInsets.all(0),
            minSize: 5,
            child: Icon(
              Iconsax.trash,
              color: kErrorColor,
              size: deviceType(media.width) > 2 ? 30 : 20,
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            child: Stack(
              children: [
                Positioned(
                  bottom: -media.height * .65,
                  child: pageBackground(media, colorScheme),
                ),
                GetBuilder<LandLordViewPropertyController>(
                  init: LandLordViewPropertyController(),
                  builder: (context) {
                    return ListView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      children: [
                        BannerCarousel(
                          pageController: controller.pageController,
                          customizedBanners: controller.customBanners(
                            media,
                            numberOfBanners: 4,
                          ),
                          activeColor: kAccentColor,
                          borderRadius: 24,
                          width: media.width,
                          height: media.height * .2,
                          margin: const EdgeInsets.all(0),
                          // showIndicator: false,
                          animation: true,
                          viewportFraction: 1,
                        ),
                        kSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: media.width - 150,
                                  child: Text(
                                    "Woodland Apartment",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: media.width - 150,
                                  child: Text(
                                    "1012 Ocean avanue, New yourk, USA",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      color: colorScheme.inversePrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: media.width / 4,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: kRedCardColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                "For Rent",
                                textAlign: TextAlign.center,
                                style: defaultTextStyle(
                                  color: kRedColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: -0.40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        kSizedBox,
                        Container(
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
                                color: kGreenCardColor.withOpacity(0.2),
                                offset: const Offset(4, 10),
                                blurRadius: 10,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You have",
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      fontSize: 12,
                                      color: kTextWhiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: media.width - 150,
                                    child: Text(
                                      "12 new bids",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: defaultTextStyle(
                                        fontSize: 16,
                                        color: kTextWhiteColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: kLightGreyColor,
                                height: 40,
                                width: 2,
                              ),
                              CupertinoButton(
                                onPressed: () {},
                                padding: const EdgeInsets.all(0),
                                borderRadius: BorderRadius.circular(50),
                                child: Text(
                                  "View\ndetails",
                                  textAlign: TextAlign.start,
                                  style: defaultTextStyle(
                                    fontSize: 14,
                                    color: kTextWhiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kSizedBox,
                        CupertinoButton(
                          onPressed: () {},
                          padding: const EdgeInsets.all(0),
                          borderRadius: BorderRadius.circular(24),
                          pressedOpacity: .6,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color:
                                  colorScheme.inversePrimary.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: colorScheme.inversePrimary,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Listing Agent",
                                      style: defaultTextStyle(
                                        fontSize: 10,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    kHalfSizedBox,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        circleAvatarImage(colorScheme),
                                        kHalfWidthSizedBox,
                                        SizedBox(
                                          width: media.width - 200,
                                          child: Text(
                                            "Ifeanyi Okigbo",
                                            style: defaultTextStyle(
                                              fontSize: 14,
                                              color: kTextBlackColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Iconsax.arrow_right,
                                  color: kDarkBackgroundColor,
                                )
                              ],
                            ),
                          ),
                        ),
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
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            borderRadius: BorderRadius.circular(100),
                            onPressed: controller.scrollToTop,
                            color: kAccentColor,
                            child: const Icon(Iconsax.arrow_up_14),
                          ),
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
