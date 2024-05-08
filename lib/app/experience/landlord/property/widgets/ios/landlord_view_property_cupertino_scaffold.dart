import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/utils/components/circle_avatar_image.dart';
import 'package:kribb/src/utils/components/responsive_constants.dart';
import 'package:kribb/theme/colors.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_view_property_controller.dart';

class LandLordViewPropertyCupertinoScaffold extends StatelessWidget {
  const LandLordViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordViewPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: viewPropertyCupertinoNavBar(
        colorScheme,
        media,
        previousPageTitle: "Home",
        deleteFunction: () {},
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            controller: controller.scrollController,
            child: Stack(
              children: [
                GetBuilder<LandLordViewPropertyController>(
                  init: LandLordViewPropertyController(),
                  builder: (context) {
                    return ListView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      children: [
                        viewPropertyBannerCarousel(
                          controller,
                          media,
                          numberOfBanners: 4,
                        ),
                        kSizedBox,
                        viewPropertyTitleSection(
                          media,
                          colorScheme,
                          propertyName: "Woodland Apartment",
                          propertyTag: "For rent",
                        ),
                        kSizedBox,
                        viewPropertyNewBidsAlert(
                          media,
                          numberOfBids: "12",
                          viewDetailsOfNewBids: () {},
                        ),
                        kSizedBox,
                        // listingAgentButton(
                        //   colorScheme,
                        //   media,
                        //   agentName: "Ifeanyi Okigbo",
                        // ),
                        // kSizedBox,
                        viewPropertyDetailsSection(
                          media,
                          numberOfBeds: 4,
                          numberOfBaths: 4,
                          sqm: 200,
                          propertyTag: "Rent",
                        ),
                        kSizedBox,
                        Text(
                          "Description",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        kHalfSizedBox,
                        viewPropertyDescription(
                          colorScheme,
                          descriptionText:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        ),
                        kSizedBox,
                        Text(
                          "Address",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        kHalfSizedBox,
                        Text(
                          "631 Akpos Celina Avenue, Matic lane, Enugu state.",
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        kSizedBox,
                        viewPropertyEditCupertinoButton(
                          colorScheme,
                          media,
                          priceOfProperty: 350000,
                          paymentFrequency: "year",
                          editProperty: () {},
                        ),
                        kSizedBox,
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

  Widget viewPropertyEditCupertinoButton(
    colorScheme,
    media, {
    priceOfProperty,
    paymentFrequency,
    editProperty,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: "NGN ${formatIntNumber(priceOfProperty ?? 0)}",
              style: defaultTextStyle(
                color: colorScheme.primary,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                  text: "/$paymentFrequency",
                  style: defaultTextStyle(
                    color: kGreyColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          CupertinoButton(
            onPressed: editProperty ?? () {},
            padding: const EdgeInsets.all(20),
            color: kGreenCardColor,
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              width: media.width / 3,
              height: 30,
              child: Center(
                child: Text(
                  "Edit",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    fontSize: 16,
                    color: kTextWhiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewPropertyDescription(colorScheme, {descriptionText}) {
    return ReadMoreText(
      descriptionText ?? "",
      textAlign: TextAlign.start,
      colorClickableText: kAccentColor,
      delimiter: "...",
      trimLines: 4,
      trimMode: TrimMode.Line,
      delimiterStyle: defaultTextStyle(
        color: kAccentColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      style: defaultTextStyle(
        color: colorScheme.inversePrimary,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    );
  }

  Widget viewPropertyDetailsSection(
    media, {
    numberOfBeds,
    numberOfBaths,
    sqm,
    propertyTag,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: ShapeDecoration(
        color: kAccentColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.single_bed_rounded,
                color: kAccentColor,
              ),
              kHalfSizedBox,
              SizedBox(
                width: media.width / 5,
                child: Text(
                  "$numberOfBeds  Beds",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: kGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.bathtub_rounded,
                color: kAccentColor,
              ),
              kHalfSizedBox,
              SizedBox(
                width: media.width / 4,
                child: Text(
                  "$numberOfBaths Baths",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: kGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.home_15,
                color: kAccentColor,
              ),
              kHalfSizedBox,
              SizedBox(
                width: media.width / 4,
                child: Text(
                  "${intFormattedText(sqm)}  Sqm",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: kGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.tag5,
                color: kAccentColor,
              ),
              kHalfSizedBox,
              SizedBox(
                width: media.width / 6,
                child: Text(
                  propertyTag ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    color: kGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget listingAgentButton(
    colorScheme,
    media, {
    goToListingAgent,
    agentImage,
    agentName,
  }) {
    return CupertinoButton(
      onPressed: goToListingAgent ?? () {},
      padding: const EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(24),
      pressedOpacity: .6,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: colorScheme.inversePrimary.withOpacity(0.4),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    circleAvatarImage(
                      colorScheme,
                      foregroundImage: agentImage ??
                          const NetworkImage(Assets.userPlaceholderImage),
                    ),
                    kHalfWidthSizedBox,
                    SizedBox(
                      width: media.width - 200,
                      child: Text(
                        agentName ?? "",
                        style: defaultTextStyle(
                          fontSize: 14,
                          color: colorScheme.primary,
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
    );
  }

  Widget viewPropertyNewBidsAlert(
    media, {
    numberOfBids,
    viewDetailsOfNewBids,
  }) {
    return Container(
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
                  "$numberOfBids new bids",
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
            onPressed: viewDetailsOfNewBids ?? () {},
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
    );
  }

  Widget viewPropertyTitleSection(
    media,
    colorScheme, {
    propertyName,
    propertyTag,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: media.width - 150,
          child: Text(
            propertyName ?? "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
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
            propertyTag ?? "For Rent",
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
    );
  }

  Widget viewPropertyBannerCarousel(controller, media, {numberOfBanners}) {
    return BannerCarousel(
      pageController: controller.pageController,
      customizedBanners: controller.customBanners(
        media,
        numberOfBanners: numberOfBanners ?? 4,
      ),
      activeColor: kAccentColor,
      borderRadius: 24,
      width: media.width,
      height: media.height * .2,
      margin: const EdgeInsets.all(0),
      // showIndicator: false,
      animation: true,
      viewportFraction: 1,
    );
  }

  CupertinoNavigationBar viewPropertyCupertinoNavBar(colorScheme, media,
      {previousPageTitle, deleteFunction}) {
    return CupertinoNavigationBar(
      previousPageTitle: previousPageTitle ?? "",
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
          onPressed: deleteFunction ?? () {},
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
    );
  }
}
