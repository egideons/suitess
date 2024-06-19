import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/buttons/ios/scroll_to_top_cupertino_button.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/containers/page_background.dart';
import 'package:typewritertext/v3/typewriter.dart';

import '../../../../../src/controllers/app/homescreen_controller.dart';
import '../../../../../src/routes/routes.dart';
import '../../../../../src/utils/components/cupertino_message_alert_nav.dart';
import '../../content/home_screen_no_properties.dart';
import 'components/add_a_property_cupertino_button.dart';
import 'components/add_property_cupertino_button.dart';
import 'components/agent_cupertino_card.dart';
import 'components/cupertino_navbar.dart';
import 'components/cupertino_property_card.dart';
import 'components/number_of_available_agents_cupertino_card.dart';

class HomeScreenCupertinoScaffold extends GetView<HomescreenController> {
  const HomeScreenCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = HomescreenController.instance;

    return CupertinoPageScaffold(
      navigationBar: landLordHomeScreenCupertinoNavBar(
        colorScheme,
        media,
        location: "Enugu, Nigeria",
        goToNotifications: () {
          Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
        },
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
                GetBuilder<HomescreenController>(
                  init: HomescreenController(),
                  builder: (context) {
                    return ListView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      children: [
                        TypeWriter.text("Manage your \nproperties with ease",
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                            duration: const Duration(milliseconds: 100)),
                        kSizedBox,
                        formFieldContainer(
                          colorScheme,
                          media,
                          child: CupertinoSearchTextField(
                            autocorrect: true,
                            enableIMEPersonalizedLearning: true,
                            controller: controller.searchController,
                            placeholder: "Tap to explore",
                            placeholderStyle: defaultTextStyle(
                              color: colorScheme.inversePrimary,
                              fontWeight: FontWeight.normal,
                            ),
                            onSubmitted: (value) {},
                            onChanged: (value) {},
                          ),
                        ),
                        kSizedBox,
                        controller.isKYCVerified.value
                            ? Column(
                                children: [
                                  cupertinoMessageAlertNav(
                                    media,
                                    message: "KYC not verified",
                                  ),
                                  const SizedBox(height: kDefaultPadding * 1.4),
                                  // kSizedBox,
                                ],
                              )
                            : const SizedBox(),
                        controller.availableAgentsIsVisible.value
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
                                    return landLordAgentBidCupertinoCard(
                                      colorScheme,
                                      media,
                                      controller,
                                      agentName: "Mr Tunde Edward",
                                      nameOfProperty: "Ibiam Hostel",
                                      addressOfProperty: "No 8 Ezimiro, Enugu",
                                      priceOfProperty:
                                          "NGN ${formatDoubleNumber(350000)}",
                                    );
                                  },
                                ),
                              )
                            : homeScreenNoOfAvailableAgentsCupertinoCard(
                                media,
                                onPressed: controller.showAvailableAgents,
                              ),
                        kSizedBox,
                        Row(
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
                                ? const SizedBox()
                                : addPropertyCupertinoButton(
                                    onPressed: () {
                                      Get.toNamed(
                                        Routes.landLordAddProperty,
                                        preventDuplicates: true,
                                      );
                                    },
                                  ),
                          ],
                        ),
                        kSizedBox,
                        controller.hasProperties.value
                            ? Column(
                                children: [
                                  homeScreenNoProperties(media, colorScheme),
                                  kSizedBox,
                                  homeScreenAddAPropertyCupertinoButton(
                                    colorScheme,
                                    onPressed: () {
                                      Get.toNamed(
                                        Routes.landLordAddProperty,
                                        preventDuplicates: true,
                                      );
                                    },
                                  ),
                                ],
                              )
                            : ListView.separated(
                                itemCount: 10,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                separatorBuilder: (context, index) => kSizedBox,
                                itemBuilder: (context, index) {
                                  return homeScreenCupertinoPropertyCard(
                                    colorScheme,
                                    media,
                                    goToProperty: () {
                                      Get.toNamed(
                                        Routes.landLordViewProperty,
                                        preventDuplicates: true,
                                      );
                                    },
                                    propertyName: "Sky Dandelions\nApartments",
                                    propertyRating: "4.9",
                                    propertyLocation: "Indepence Layout, Enugu",
                                    propertyPrice: formatDoubleNumber(80000),
                                    propertyPaymentFreq: "/month",
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
                          child: scrollToTopCupertinoButton(controller),
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
