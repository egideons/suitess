import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/experience/landlord/bid_details/widgets/ios/utils/bid_details_cupertino_navbar.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/landlord_bid_detail_controller.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../content/bid_source_section.dart';
import '../../content/price_details_section.dart';
import 'utils/property_details_cupertino_button.dart';

class LandLordBidDetailsCupertinoScaffold
    extends GetView<LandLordBidDetailsController> {
  const LandLordBidDetailsCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<LandLordBidDetailsController>(
        init: LandLordBidDetailsController(),
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
                      : kRedColor,
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
                                : kRedColor,
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
