import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';
import 'package:kribb/src/utils/containers/page_background.dart';
import 'package:kribb/theme/colors.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../../../../../src/controllers/landlord_homescreen_controller.dart';
import '../../../../../../src/utils/components/cupertino_message_alert_nav.dart';
import '../../content/home_screen_no_properties.dart';
import 'utils/add_a_property_cupertino_button.dart';
import 'utils/add_property_cupertino_button.dart';
import 'utils/agent_cupertino_card.dart';
import 'utils/cupertino_navbar.dart';
import 'utils/cupertino_property_card.dart';
import 'utils/number_of_available_agents_cupertino_card.dart';

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
                GetBuilder<LandlordHomescreenController>(
                  init: LandlordHomescreenController(),
                  builder: (context) {
                    return ListView(
                      controller: controller.scrollController,
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
                              ? cupertinoMessageAlertNav(
                                  media,
                                  message: "KYC not verified",
                                )
                              : const SizedBox(),
                        ),
                        Obx(
                          () => controller.isKYCVerified.value
                              ? const SizedBox(height: kDefaultPadding * 2)
                              : const SizedBox(),
                        ),
                        Obx(() => controller.availableAgentsIsVisible.value
                            ? SizedBox(
                                height: media.height * .28,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 10,
                                  separatorBuilder: (context, index) =>
                                      kWidthSizedBox,
                                  itemBuilder: (context, index) {
                                    return landLordHomeScreenAgentCupertinoCard(
                                      colorScheme,
                                      media,
                                      controller,
                                      agentName: "Mr Tunde Edward",
                                      nameOfProperty: "Ibiam Hostel",
                                      addressOfProperty: "No 8 Ezimiro, Enugu",
                                      priceOfProperty:
                                          "NGN ${doubleFormattedText(3500000)}",
                                    );
                                  },
                                ),
                              )
                            : homeScreenNoOfAvailableAgentsCupertinoCard(
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
                                    ? addPropertyCupertinoButton()
                                    : const SizedBox(),
                              ],
                            );
                          },
                        ),
                        kSizedBox,
                        GetBuilder<LandlordHomescreenController>(
                          init: LandlordHomescreenController(),
                          builder: (controller) {
                            return controller.hasProperties.value
                                ? Column(
                                    children: [
                                      homeScreenNoProperties(
                                          media, colorScheme),
                                      kSizedBox,
                                      homeScreenAddAPropertyCupertinoButton(
                                          colorScheme),
                                    ],
                                  )
                                : ListView.separated(
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        kSizedBox,
                                    itemBuilder: (context, index) {
                                      return homeScreenCupertinoPropertyCard(
                                        colorScheme,
                                        media,
                                        propertyName:
                                            "Sky Dandelions\nApartments",
                                        propertyRating: "4.9",
                                        propertyLocation:
                                            "Indepence Layout, Enugu",
                                        propertyPrice:
                                            doubleFormattedText(80000),
                                        propertyPaymentFreq: "/month",
                                      );
                                    },
                                  );
                          },
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