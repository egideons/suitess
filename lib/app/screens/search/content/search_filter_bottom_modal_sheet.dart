import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/search/content/filter_screen_advert_category_drop_down.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/buttons/android/android_outlined_button.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/app/search_screen_controller.dart';
import '../../../../theme/colors.dart';
import 'filter_screen_location_drop_down.dart';
import 'filter_screen_section_header.dart';

class SearchFilterBottomModalSheet extends GetView<SearchScreenController> {
  const SearchFilterBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        bottom: myAppBar(colorScheme, media, title: "Filter"),
      ),
      body: Scrollbar(
        controller: controller.scrollController,
        child: GetBuilder<SearchScreenController>(
          init: SearchScreenController(),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  filterScreenSectionHeader("Location"),
                  kHalfSizedBox,
                  filterScreenLocationDropDown(media, colorScheme, controller),
                  kSizedBox,
                  filterScreenSectionHeader("Property Type"),
                  kHalfSizedBox,
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: controller.propertyType.length,
                      separatorBuilder: (context, index) => kSmallWidthSizedBox,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.selectPropertyType(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: ShapeDecoration(
                              color: controller.propertyType[index].isSelected
                                  ? kAccentColor
                                  : kGreyColor.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              controller.propertyType[index].name,
                              style: defaultTextStyle(
                                fontSize: 12,
                                color: controller.propertyType[index].isSelected
                                    ? kTextWhiteColor
                                    : colorScheme.inversePrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  kSizedBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterScreenSectionHeader("Advert category"),
                      filterScreenSectionHeader("Bedrooms"),
                      kWidthSizedBox,
                    ],
                  ),
                  kHalfSizedBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: filterScreenAdvertCategoryDropDown(
                          media,
                          colorScheme,
                          controller,
                        ),
                      ),
                      kWidthSizedBox,
                      Expanded(
                        child: formFieldContainer(
                          colorScheme,
                          media,
                          // padding: const EdgeInsets.all(20),
                          containerHeight: media.height * .075,
                          borderRadius: 4,
                          borderSideColor: colorScheme.inversePrimary,
                          child: AndroidTextFormField(
                            hintText: "0",
                            controller: controller.searchFilterNumOfBedroomsEC,
                            textInputAction: TextInputAction.done,
                            focusNode: controller.searchFilterNumOfBedroomsFN,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  kSizedBox,
                  filterScreenSectionHeader("Price range"),
                  kHalfSizedBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: formFieldContainer(
                          colorScheme,
                          media,
                          // padding: const EdgeInsets.all(20),
                          containerHeight: media.height * .075,
                          borderRadius: 4,
                          borderSideColor: colorScheme.inversePrimary,
                          child: AndroidTextFormField(
                            hintText: "Min",
                            controller: controller.searchFilterPriceMaxEC,
                            textInputAction: TextInputAction.done,
                            focusNode: controller.searchFilterPriceMaxFN,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                      kWidthSizedBox,
                      Expanded(
                        child: formFieldContainer(
                          colorScheme,
                          media,
                          // padding: const EdgeInsets.all(20),
                          containerHeight: media.height * .075,
                          borderRadius: 4,
                          borderSideColor: colorScheme.inversePrimary,
                          child: AndroidTextFormField(
                            hintText: "Max",
                            controller: controller.searchFilterPriceMinEC,
                            textInputAction: TextInputAction.done,
                            focusNode: controller.searchFilterPriceMinFN,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  kSizedBox,
                  filterScreenSectionHeader("Realtors Verification Status"),
                  kHalfSizedBox,
                  ListView.separated(
                    itemCount: FilterOption.values.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      final option = FilterOption.values[index];
                      return Obx(
                        () => RadioListTile<FilterOption>(
                          value: option,
                          groupValue: controller.selectedFilter.value,
                          contentPadding: const EdgeInsets.all(0),
                          dense: true,
                          activeColor: kAccentColor,
                          hoverColor: kAccentColor,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          onChanged:
                              controller.realtorVerificationStatusOnChanged,
                          title: Text(
                            controller.getFilterOptionText(option),
                            style: defaultTextStyle(
                              color: kTextGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  kSizedBox,
                  filterScreenSectionHeader("Furnishing"),
                  kHalfSizedBox,
                  ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: FurnishOption.values.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      final option = FurnishOption.values[index];
                      return Obx(
                        () {
                          return CheckboxListTile(
                            value: controller.isSelectedFurnishOption(option),
                            onChanged: (_) =>
                                controller.toggleFurnishOption(option),
                            dense: true,
                            contentPadding: const EdgeInsets.all(0),
                            checkColor: kLightBackgroundColor,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: kAccentColor,
                            title: Text(
                              controller.getFurnishOptionText(option),
                              style: defaultTextStyle(
                                color: kTextGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  kSizedBox,
                  filterScreenSectionHeader("Condition"),
                  kHalfSizedBox,
                  ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: ConditionOption.values.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      final option = ConditionOption.values[index];
                      return Obx(
                        () {
                          return CheckboxListTile(
                            value: controller.isSelectedConditionOption(option),
                            onChanged: (_) =>
                                controller.toggleConditionOption(option),
                            dense: true,
                            contentPadding: const EdgeInsets.all(0),
                            checkColor: kLightBackgroundColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            activeColor: kAccentColor,
                            title: Text(
                              controller.getConditionOptionText(option),
                              style: defaultTextStyle(
                                color: kTextGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  kBigSizedBox,
                  AndroidOutlinedButton(
                    title: "Reset filters",
                    onPressed: () {},
                    borderColor: kAccentColor,
                    textColor: kAccentColor,
                    borderWidth: 1,
                  ),
                  kHalfSizedBox,
                  AndroidElevatedButton(
                    title: "Apply",
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
