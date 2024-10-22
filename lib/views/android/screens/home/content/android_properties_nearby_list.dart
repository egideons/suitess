import 'package:flutter/material.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/home_screen_controller.dart';

propertiesNearbyList(HomeScreenController controller, ColorScheme colorScheme) {
  return SizedBox(
    height: 30,
    child: ListView.separated(
      itemCount: controller.propertyCategories.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (context, index) => kHalfWidthSizedBox,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.selectPropertyCategory(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: controller.propertyCategories[index].isSelected
                  ? colorScheme.secondary.withOpacity(.4)
                  : colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              controller.propertyCategories[index].name,
              style: defaultTextStyle(
                fontSize: 12,
                color: controller.propertyCategories[index].isSelected
                    ? colorScheme.secondary
                    : colorScheme.inversePrimary,
              ),
            ),
          ),
        );
      },
    ),
  );
}
