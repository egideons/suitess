import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../../../../../../src/utils/components/my_app_bar.dart';
import '../../../../../../theme/colors.dart';

class WalletTransferScaffold extends GetView<WalletTransferController> {
  const WalletTransferScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Transfer",
        actions: [],
      ),
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
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              Text(
                "Source Account",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kHalfSizedBox,
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 0,
                          color: kAccentColor.withOpacity(.2),
                          offset: const Offset(0, 10),
                        )
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kWalletCardColor,
                          kWalletCardColor.withOpacity(.6),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 80,
                          child: PageView.builder(
                            controller: controller.walletCardPageController,
                            itemCount: controller.sourceAccounts.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.walletFilledIconSvg,
                                          color: kLightBackgroundColor,
                                        ),
                                        Text(
                                          "Available balance",
                                          textAlign: TextAlign.start,
                                          style: defaultTextStyle(
                                            color: kTextWhiteColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    kHalfSizedBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller.sourceAccounts[index]
                                                .walletName,
                                            textAlign: TextAlign.start,
                                            style: defaultTextStyle(
                                              color: kTextWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: media.width - 180,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text.rich(
                                              softWrap: true,
                                              TextSpan(
                                                text: "$nairaSign ",
                                                style: defaultTextStyle(
                                                  color: kTextWhiteColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  fontFamily: "",
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: doubleFormattedTextWithDecimal(
                                                        controller
                                                            .sourceAccounts[
                                                                index]
                                                            .availableBalance),
                                                    style: defaultTextStyle(
                                                      color: kTextWhiteColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller.walletCardPageController,
                            count: controller.sourceAccounts.length,
                            axisDirection: Axis.horizontal,
                            effect: WormEffect(
                              spacing: 6,
                              radius: 20.0,
                              dotWidth: 6.0,
                              dotHeight: 3,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 1.0,
                              type: WormType.thinUnderground,
                              dotColor: kLightBackgroundColor.withOpacity(.2),
                              activeDotColor: colorScheme.surface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 1.4,
                    left: 1.4,
                    child: SvgPicture.asset(
                      Assets.walletCardEllipse1Svg,
                      color: kStarColor,
                    ),
                  ),
                  Positioned(
                    bottom: 1.5,
                    right: 1.4,
                    child: SvgPicture.asset(
                      Assets.walletCardEllipse2Svg,
                      color: kStarColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
