import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suitess/app/screens/property/view_property/content/view_property_description.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/view_property_controller.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../theme/colors.dart';

class ViewPropertyScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: Scrollbar(
        controller: controller.scrollController,
        child: GetBuilder<ViewPropertyController>(
            init: ViewPropertyController(),
            builder: (controller) {
              return CustomScrollView(
                controller: controller.scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: colorScheme.surface,
                    elevation: 0,
                    pinned: true,
                    centerTitle: false,
                    expandedHeight: 300,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: colorScheme.surface,
                        size: 30,
                      ),
                    ),
                    flexibleSpace: Stack(
                      children: [
                        PageView.builder(
                          controller: controller.imageController.value,
                          itemCount: controller.propertyImages.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FlexibleSpaceBar(
                              background: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  controller.propertyImages[index],
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: media.height / 2.6,
                          left: media.width / 2.3,
                          child: SmoothPageIndicator(
                            controller: controller.imageController.value,
                            count: controller.propertyImages.length,
                            onDotClicked: (index) {
                              controller.imageController.value.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                              controller.imageController.value.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            effect: SlideEffect(
                              spacing: 10,
                              dotWidth: 10,
                              dotHeight: 10,
                              radius: 20.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.0,
                              type: SlideType.slideUnder,
                              dotColor: colorScheme.surface,
                              activeDotColor: colorScheme.surface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 40,
                              decoration: ShapeDecoration(
                                color:
                                    colorScheme.inversePrimary.withOpacity(.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ),
                          kSizedBox,
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              itemCount: controller.propertyTabs.length,
                              separatorBuilder: (context, index) =>
                                  kHalfWidthSizedBox,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.selectTab(index);
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.propertyTabs[index].name,
                                          style: defaultTextStyle(
                                            fontSize: 12,
                                            color: controller
                                                    .propertyTabs[index]
                                                    .isSelected
                                                ? kAccentColor
                                                : colorScheme.inversePrimary
                                                    .withOpacity(.6),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          padding: const EdgeInsets.all(5),
                                          width: 50,
                                          height: 5,
                                          decoration: ShapeDecoration(
                                            color: controller
                                                    .propertyTabs[index]
                                                    .isSelected
                                                ? kAccentColor
                                                : colorScheme.surface,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
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
                          kSizedBox,
                          controller.propertyTabs.first.isSelected
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "4 Flats Woodland Apartment",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: defaultTextStyle(
                                              fontSize: 14,
                                              color: kTextBoldHeadingColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: "$nairaSign ",
                                            style: defaultTextStyle(
                                              fontFamily: "",
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: intFormattedText(350000),
                                                style: defaultTextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // TextSpan(
                                              //   text: "month",
                                              //   style: defaultTextStyle(
                                              //     fontWeight: FontWeight.normal,
                                              //     fontSize: 10,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                height: 20,
                                                width: 20,
                                                Assets
                                                    .locationPinOutlineIconSvg,
                                                color: colorScheme.primary
                                                    .withOpacity(.5),
                                                fit: BoxFit.contain,
                                              ),
                                              Text(
                                                "Independence layout, Enugu",
                                                overflow: TextOverflow.ellipsis,
                                                style: defaultTextStyle(
                                                  fontSize: 12,
                                                  color: colorScheme
                                                      .inversePrimary,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: ShapeDecoration(
                                            color: kBannerBackgroundColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Sale",
                                              textAlign: TextAlign.center,
                                              style: defaultTextStyle(
                                                fontSize: 10,
                                                color: kBannerTextColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSizedBox,
                                    Text(
                                      "Price Flexibility",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: defaultTextStyle(
                                        fontSize: 14,
                                        color: kTextBoldHeadingColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    kHalfSizedBox,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.greenDotSvg,
                                              ),
                                              kHalfWidthSizedBox,
                                              Text(
                                                "Negotiable",
                                                overflow: TextOverflow.ellipsis,
                                                style: defaultTextStyle(
                                                  fontSize: 12,
                                                  color: colorScheme
                                                      .inversePrimary,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: colorScheme
                                                      .inversePrimary
                                                      .withOpacity(.4),
                                                ),
                                              ),
                                            ),
                                            child: LinearProgressIndicator(
                                              value: 0,
                                              minHeight: 10,
                                              backgroundColor: colorScheme
                                                  .inversePrimary
                                                  .withOpacity(0.2),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                kAccentColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSizedBox,
                                    Text(
                                      "Facilities",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: defaultTextStyle(
                                        fontSize: 14,
                                        color: kTextBoldHeadingColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    kHalfSizedBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              height: 20,
                                              width: 20,
                                              Assets.bedOutlineSvg,
                                              color: colorScheme.primary
                                                  .withOpacity(.5),
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              "4 Beds",
                                              overflow: TextOverflow.ellipsis,
                                              style: defaultTextStyle(
                                                fontSize: 12,
                                                color:
                                                    colorScheme.inversePrimary,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              height: 20,
                                              width: 20,
                                              Assets.bathOutlineSvg,
                                              color: colorScheme.primary
                                                  .withOpacity(.5),
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              "2 Baths",
                                              overflow: TextOverflow.ellipsis,
                                              style: defaultTextStyle(
                                                fontSize: 12,
                                                color:
                                                    colorScheme.inversePrimary,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              height: 20,
                                              width: 20,
                                              Assets.kitchenOutlineSvg,
                                              color: colorScheme.primary
                                                  .withOpacity(.5),
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              "1 Kitchen",
                                              overflow: TextOverflow.ellipsis,
                                              style: defaultTextStyle(
                                                fontSize: 12,
                                                color:
                                                    colorScheme.inversePrimary,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              height: 20,
                                              width: 20,
                                              Assets.measureOutlineSvg,
                                              color: colorScheme.primary
                                                  .withOpacity(.5),
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              "200 Sqft",
                                              overflow: TextOverflow.ellipsis,
                                              style: defaultTextStyle(
                                                fontSize: 12,
                                                color:
                                                    colorScheme.inversePrimary,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    kSizedBox,
                                    Text(
                                      "Description",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: defaultTextStyle(
                                        fontSize: 14,
                                        color: kTextBoldHeadingColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    kHalfSizedBox,
                                    viewPropertyDescription(
                                      colorScheme,
                                      descriptionText:
                                          "4 flats with 4 bedroom each. 1750sqm along the major tarred road between T-junction and Nike Lake Resort Hotel. Good for commercial purposes with certificate of occupancy (C of O).",
                                    )
                                  ],
                                )
                              : const Column(
                                  children: [],
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
