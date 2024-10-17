import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../controllers/app/view_property_controller.dart';

androidViewPropertyCarouselIndicator(
  Size media,
  ViewPropertyController controller,
  ColorScheme colorScheme,
) {
  return Positioned(
    top: media.height / 2.66,
    left: media.width / 2.3,
    child: SmoothPageIndicator(
      controller: controller.imageController.value,
      count: controller.propertyCarouselImages.length,
      onDotClicked: (index) {
        controller.imageController.value.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        controller.imageController.value.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      effect: SlideEffect(
        spacing: 10,
        dotWidth: 10,
        dotHeight: 10,
        radius: 20.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.0,
        type: SlideType.slideUnder,
        dotColor: colorScheme.surface,
        activeDotColor: colorScheme.surface,
      ),
    ),
  );
}
