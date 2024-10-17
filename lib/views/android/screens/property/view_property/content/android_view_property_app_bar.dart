import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/view_property_controller.dart';
import 'android_view_property_carousel.dart';
import 'android_view_property_carousel_indicator.dart';

androidViewPropertyAppBar(
  ColorScheme colorScheme,
  ViewPropertyController controller,
  Size media,
) {
  return SliverAppBar(
    backgroundColor: colorScheme.primary,
    elevation: 0,
    pinned: true,
    centerTitle: false,
    expandedHeight: 300,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        color: colorScheme.surface,
        size: 30,
      ),
    ),
    flexibleSpace: Stack(
      children: [
        androidViewPropertyCarousel(controller),
        androidViewPropertyCarouselIndicator(media, controller, colorScheme),
      ],
    ),
  );
}
