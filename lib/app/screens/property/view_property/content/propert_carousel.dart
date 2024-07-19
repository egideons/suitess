import 'package:flutter/material.dart';

import '../../../../../src/controllers/app/view_property_controller.dart';

viewPropertyCarousel(ViewPropertyController controller) {
  return PageView.builder(
    controller: controller.imageController.value,
    itemCount: controller.propertyCarouselImages.length,
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return FlexibleSpaceBar(
        background: Image(
          fit: BoxFit.cover,
          image: AssetImage(
            controller.propertyCarouselImages[index],
          ),
        ),
      );
    },
  );
}
