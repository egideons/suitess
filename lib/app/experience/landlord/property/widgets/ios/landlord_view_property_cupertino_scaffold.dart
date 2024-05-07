import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/utils/components/responsive_constants.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_view_property_controller.dart';
import '../../../../../../src/utils/containers/page_background.dart';

class LandLordViewPropertyCupertinoScaffold extends StatelessWidget {
  const LandLordViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordViewPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Home",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: colorScheme.background),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: ShapeDecoration(
            color: kRedCardColor.withOpacity(0.15),
            shape: const CircleBorder(),
          ),
          child: CupertinoButton(
            onPressed: () {},
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(100),
            padding: const EdgeInsets.all(0),
            minSize: 5,
            child: Icon(
              Iconsax.trash,
              color: kErrorColor,
              size: deviceType(media.width) > 2 ? 30 : 20,
            ),
          ),
        ),
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
                GetBuilder<LandLordViewPropertyController>(
                  init: LandLordViewPropertyController(),
                  builder: (context) {
                    return ListView(
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      children: [
                        BannerCarousel(
                          banners: controller.listBanners,
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
