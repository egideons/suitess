import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/screens/bid_details/platform/ios/utils/bid_details_cupertino_navbar.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/bid_details_controller.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../content/bid_source_section.dart';
import '../../content/price_details_section.dart';
import 'utils/property_details_cupertino_button.dart';

class BidDetailsCupertinoScaffold extends GetView<BidDetailsController> {
  const BidDetailsCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<BidDetailsController>(
        init: BidDetailsController(),
        builder: (controller) {
          return CupertinoPageScaffold(
            navigationBar: bidDetailsCupertinoNavBar(
              colorScheme,
              media,
              previousPageTitle: "Back",
              pageTitle: controller.bidIsNull.value
                  ? "Offer details"
                  : controller.bidIsAccepted.value
                      ? "Offer acceped"
                      : "Offer declined",
              titleColor: controller.bidIsNull.value
                  ? colorScheme.primary
                  : controller.bidIsAccepted.value
                      ? kSuccessColor
                      : kErrorColor,
            ),
            child: SafeArea(
              child: CupertinoScrollbar(
                controller: controller.scrollController,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    bidSourceSection(
                      colorScheme,
                      media,
                      controller,
                      nameOfSource: "Leleh Henry",
                      emailOfSource: "henryleleh@gmail.com",
                      sourceTag: "Agent",
                    ),
                    kSizedBox,
                    propertyDetailCupertinoButton(
                      media,
                      colorScheme,
                      nameOfProperty: "Woodland Apartment",
                      addressOfProperty:
                          "631 Akpos Celina Avenue, Matic lane, Enugu state.",
                      goBackToProperty: () {
                        Get.back();
                      },
                    ),
                    kSizedBox,
                    kSizedBox,
                    priceDetailsSection(
                      media,
                      colorScheme,
                      priceOfProperty: 350000.0,
                      bidPrice: 350000.0,
                      agentFee: 80000.0,
                    ),
                    kSizedBox,
                    kSizedBox,
                    controller.bidIsNull.value
                        ? const SizedBox()
                        : CupertinoElevatedButton(
                            title: "Done",
                            buttonColor: colorScheme.secondary,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                    controller.bidIsNull.value
                        ? CupertinoElevatedButton(
                            title: "Accept",
                            buttonColor: kGreenColor,
                            disable: controller.isDeclining.value,
                            onPressed: controller.acceptBid,
                            isLoading: controller.isAccepting.value,
                          )
                        : const SizedBox(),
                    kSizedBox,
                    controller.bidIsNull.value
                        ? CupertinoElevatedButton(
                            title: "Decline",
                            textColor: controller.isAccepting.value
                                ? kTextWhiteColor
                                : kErrorColor,
                            buttonColor: kRedCardColor,
                            disable: controller.isAccepting.value,
                            onPressed: controller.declineBid,
                            isLoading: controller.isDeclining.value,
                          )
                        : const SizedBox(),
                    kSizedBox,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
