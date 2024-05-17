import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';

import '../../../../../../../src/controllers/landlord/landlord_add_property_controller.dart';
import '../../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../../../src/utils/buttons/ios/scroll_to_top_cupertino_button.dart';
import '../../../../../../../theme/colors.dart';

class LandLordAddPropertyCupertinoScaffold
    extends GetView<LandLordAddPropertyController> {
  const LandLordAddPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordAddPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: colorScheme.background,
        border: Border.all(color: kTransparentColor),
        transitionBetweenRoutes: true,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          controller: controller.scrollController,
          child: Stack(
            children: [
              GetBuilder<LandLordAddPropertyController>(
                init: LandLordAddPropertyController(),
                builder: (controller) {
                  return ListView(
                    controller: controller.scrollController,
                    padding: const EdgeInsets.all(10),
                    children: [
                      controller.isNoticePageVisible.value
                          ? noticeContent(
                              colorScheme,
                              controller,
                            )
                          : Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Create property",
                                    style: defaultTextStyle(
                                      color: colorScheme.primary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  kHalfSizedBox,
                                  Text(
                                    "List your property for people to buy!",
                                    style: defaultTextStyle(
                                      color: colorScheme.inversePrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  kSizedBox,
                                  kSizedBox,
                                ],
                              ),
                            ),
                      controller.isNoticePageVisible.value
                          ? CupertinoElevatedButton(
                              title: "Continue",
                              onPressed: controller.removeNotice,
                            )
                          : CupertinoElevatedButton(
                              title: "Continue",
                              onPressed: () {},
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
    );
  }

  noticeContent(
    colorScheme,
    controller, {
    noticeMessage,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Important notice".toUpperCase(),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 24,
              color: kRedColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          kSizedBox,
          Text(
            noticeMessage ??
                "jabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvb, jabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvb, jabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvbjabsufbuadbubaduvbusbdvjbsudbvusbduvbsudbvubdjbudbusbdvjbsudbvbdvjbzubvzjbvjzbudvbbbdubdbjsbduvsodbjbduvbzjdbjzbubzbvjbzuvjzbxjbziuxbuzbvjbzubvizbdubiduvb,",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
