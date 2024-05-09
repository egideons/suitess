import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_view_property_controller.dart';
import '../../content/view_property_banner_carousel.dart';
import '../../content/view_property_description.dart';
import '../../content/view_property_detail_section.dart';
import '../../content/view_property_title_section.dart';
import 'utils/new_bid_cupertino_card.dart';
import 'utils/view_property_cupertino_edit_button.dart';
import 'utils/view_property_cupertino_hide_new_bids_alert.dart';
import 'utils/view_property_cupertino_navbar.dart';
import 'utils/view_property_cupertino_show_new_bids_alert.dart';

class LandLordViewPropertyCupertinoScaffold
    extends GetView<LandLordViewPropertyController> {
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
                        Obx(
                          () => !controller.bidDetailsIsVisible.value
                              ? viewPropertyCupertinoShowNewBidsAlert(
                                  colorScheme,
                                  media,
                                  numberOfBids: 12,
                                  viewDetailsOfNewBids:
                                      controller.viewDetailsOfNewBids,
                                )
                              : viewPropertyCupertinoHideNewBidsAlert(
                                  colorScheme,
                                  media,
                                  numberOfBids: 12,
                                  hideDetailsOfNewBids:
                                      controller.hideDetailsOfNewBids,
                                ),
                        ),
                        GetBuilder<LandLordViewPropertyController>(
                          init: LandLordViewPropertyController(),
                          builder: (controller) {
                            return controller.bidDetailsIsVisible.value
                                ? SizedBox(
                                    height: media.height * .3,
                                    child: CupertinoScrollbar(
                                      child: ListView.separated(
                                        itemCount: 12,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(10),
                                        physics: const BouncingScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            kSizedBox,
                                        itemBuilder: (context, index) {
                                          return newBidCupertinoCard(
                                            colorScheme,
                                            media,
                                            openNewBid: () {},
                                            bidSource: "Customer",
                                            bidSourceUserName: "Leleh Henry",
                                            bidPrice: 350000.0,
                                            dateOfBid: "28th Oct 2021",
                                            timeOfBid: "4:30 PM",
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox();
                          },
                        ),

                        kSizedBox,
                        // listingAgentCupertinoButton(
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
}
