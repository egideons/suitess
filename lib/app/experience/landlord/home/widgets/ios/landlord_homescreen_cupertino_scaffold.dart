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
import '../../../../../../src/utils/components/cupertino_message_alert_nav.dart';
import '../../content/home_screen_no_properties.dart';
import 'utils/add_a_property_cupertino_button.dart';
import 'utils/add_property_cupertino_button.dart';
import 'utils/agent_cupertino_card.dart';
import 'utils/cupertino_navbar.dart';
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
                        Obx(() {
                          return controller.hasProperties.value
                              ? homeScreenNoProperties(media, colorScheme)
                              : const SizedBox();
                        }),
                        Obx(() => controller.hasProperties.value
                            ? kSizedBox
                            : const SizedBox()),
                        Obx(() {
                          return controller.hasProperties.value
                              ? homeScreenAddAPropertyCupertinoButton(
                                  colorScheme)
                              : const SizedBox();
                        }),
                        Obx(() => controller.hasProperties.value
                            ? kSizedBox
                            : const SizedBox()),
                        ListView.separated(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => kSizedBox,
                          itemBuilder: (context, index) {
                            return CupertinoButton(
                              onPressed: () {},
                              padding: const EdgeInsets.all(0),
                              borderRadius: BorderRadius.circular(24),
                              pressedOpacity: .6,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  color: colorScheme.inversePrimary
                                      .withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      child: Image.asset(Assets.buildings),
                                    ),
                                    kHalfWidthSizedBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: media.width - 180,
                                          child: Text(
                                            "Sky Dandelions\nApartments",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: defaultTextStyle(
                                              color: colorScheme.primary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        kHalfSizedBox,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Iconsax.magic_star5,
                                              color: kStarColor,
                                              size: 14,
                                            ),
                                            Text(
                                              "4.9",
                                              textAlign: TextAlign.start,
                                              style: defaultTextStyle(
                                                color: colorScheme.primary,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        kHalfSizedBox,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Iconsax.location5,
                                              color: kStarColor,
                                              size: 14,
                                            ),
                                            SizedBox(
                                              width: media.width - 200,
                                              child: Text(
                                                "Indepence Layout, Enugu",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                style: defaultTextStyle(
                                                  color: colorScheme.primary,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        kSizedBox,
                                        Text.rich(
                                          TextSpan(
                                            text: "NGN ",
                                            style: defaultTextStyle(
                                              fontSize: 16.0,
                                              color: colorScheme.primary,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    doubleFormattedText(80000),
                                                style: defaultTextStyle(
                                                  fontSize: 16.0,
                                                  color: colorScheme.primary,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "/month",
                                                style: defaultTextStyle(
                                                  fontSize: 10.0,
                                                  color: colorScheme.primary,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
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
