import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/view_property_controller.dart';

viewPropertyTabs(
    ViewPropertyController controller, int index, ColorScheme colorScheme) {
  return InkWell(
    onTap: () {
      controller.selectTab(index);
    },
    borderRadius: BorderRadius.circular(10),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            controller.propertyTabs[index].name,
            style: defaultTextStyle(
              fontSize: 12,
              color: controller.propertyTabs[index].isSelected
                  ? colorScheme.secondary
                  : colorScheme.inversePrimary.withOpacity(.6),
              fontWeight: FontWeight.w800,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 5,
            decoration: ShapeDecoration(
              color: controller.propertyTabs[index].isSelected
                  ? colorScheme.secondary
                  : colorScheme.surface,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
