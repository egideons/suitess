import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/app/search_screen_controller.dart';
import '../../../../theme/colors.dart';

filterScreenLocationDropDown(
  Size media,
  ColorScheme colorScheme,
  SearchScreenController controller,
) {
  return DropdownMenu(
    controller: controller.searchFilterLocationEC,
    hintText: "Select a location",
    menuHeight: media.height * .6,
    width: media.width,
    expandedInsets: const EdgeInsets.all(0),
    onSelected: controller.setSelectedLocation,
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
    dropdownMenuEntries:
        controller.searchFilterScreenLocations.map((String location) {
      return DropdownMenuEntry<String>(
        value: location,
        label: location,
        labelWidget: Text(
          location,
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
