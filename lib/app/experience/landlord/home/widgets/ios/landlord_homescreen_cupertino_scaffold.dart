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
import 'utils/add_property_cupertino_button.dart';
import 'utils/landlord_home_screen_agent_cupertino_card.dart';
import 'utils/landlord_homescreen_cupertino_navbar.dart';
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
                                  agentName:
                                      "Mr Tunde Edward suehwo sdusdonsund osuhdsd ",
                                  nameOfProperty:
                                      "Ibiam Hostel suehwo sdusdonsund osuhdsd ",
                                  addressOfProperty: "No 8 Ezimiro, Enugu.",
                                  priceOfProperty:
                                      "NGN ${doubleFormattedText(3500000)}",
                                );
                              },
                            ),
                          )
                        : noOfAvailableAgentsCupertinoCard(
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
}
