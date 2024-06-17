import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/widgets.dart';

import '../../../../../theme/colors.dart';

Widget viewPropertyBannerCarousel(controller, media, {numberOfBanners}) {
  return BannerCarousel(
    pageController: controller.pageController,
    customizedBanners: controller.customBanners(
      media,
      numberOfBanners: numberOfBanners ?? 4,
    ),
    activeColor: kAccentColor,
    borderRadius: 24,
    width: media.width,
    height: media.height * .2,
    margin: const EdgeInsets.all(0),
    // showIndicator: false,
    animation: true,
    viewportFraction: 1,
  );
}
