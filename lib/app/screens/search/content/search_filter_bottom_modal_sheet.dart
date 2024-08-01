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
