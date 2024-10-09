import 'package:flutter/material.dart';
import 'package:suitess/src/controllers/app/add_property_controller.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/constants/consts.dart';

selectPropertyTypeDropdownMenu(
  Size media,
  ColorScheme colorScheme,
  AddPropertyController controller,
) {
  return DropdownMenu(
    controller: controller.propertyTypeEC,
    hintText: "Property Type",
    menuHeight: media.height * .6,
    width: media.width,
    expandedInsets: const EdgeInsets.all(0),
    onSelected: controller.setSelectedPropertyType,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: defaultTextStyle(
        color: kFormFieldLabelTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
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
    dropdownMenuEntries: controller.propertyTypes.map((String propertyType) {
      return DropdownMenuEntry<String>(
        value: propertyType,
        label: propertyType,
        labelWidget: Text(
          propertyType,
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
