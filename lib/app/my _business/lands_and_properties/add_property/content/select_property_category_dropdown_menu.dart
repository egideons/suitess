import 'package:flutter/material.dart';
import 'package:suitess/src/controllers/app/add_property_controller.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../src/constants/consts.dart';

selectPropertyCategoryDropdownMenu(
  Size media,
  ColorScheme colorScheme,
  AddPropertyController controller,
) {
  return DropdownMenu(
    controller: controller.propertyCategoryEC,
    hintText: "Category",
    menuHeight: media.height * .6,
    width: media.width,
    expandedInsets: const EdgeInsets.all(0),
    onSelected: controller.setSelectedPropertyCategory,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: defaultTextStyle(
        color: kFormFieldLabelTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.inversePrimary.withOpacity(.2),
        ),
      ),
    ),
    selectedTrailingIcon: Icon(
      Icons.keyboard_arrow_up_rounded,
      color: colorScheme.inversePrimary.withOpacity(.4),
    ),
    trailingIcon: Icon(
      Icons.keyboard_arrow_down_rounded,
      color: colorScheme.inversePrimary.withOpacity(.4),
    ),
    textStyle: defaultTextStyle(
      fontSize: 14,
      color: kTextGreyColor,
      fontWeight: FontWeight.w400,
    ),
    dropdownMenuEntries: controller.propertyCategories.map((String category) {
      return DropdownMenuEntry<String>(
        value: category,
        label: category,
        labelWidget: Text(
          category,
          style: defaultTextStyle(
            fontSize: 14,
            color: kTextGreyColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }).toList(),
  );
}
