import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/my%20_business/lands_and_properties/add_property/content/select_property_category_dropdown_menu.dart';
import 'package:suitess/app/android/my%20_business/lands_and_properties/add_property/content/select_property_state_dropdown_menu.dart';
import 'package:suitess/app/android/my%20_business/lands_and_properties/add_property/content/select_property_type_dropdown_menu.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/add_property_controller.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';
import 'package:suitess/theme/colors.dart';

addPropertyForm(
  ColorScheme colorScheme,
  Size media,
  AddPropertyController controller,
) {
  return Form(
    key: controller.formkey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Property Details",
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: 55,
          child: AndroidTextFormField(
            labelText: "Title",
            controller: controller.propertyTitleEC,
            focusNode: controller.propertyTitleFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.name,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        selectPropertyTypeDropdownMenu(
          media,
          colorScheme,
          controller,
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: 55,
          child: AndroidTextFormField(
            labelText: "Units",
            controller: controller.propertyUnitsEC,
            focusNode: controller.propertyUnitsFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            validator: (value) {
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        kSizedBox,
        Row(
          children: [
            Expanded(
              child: selectPropertyCategoryDropdownMenu(
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
                containerHeight: 55,
                child: AndroidTextFormField(
                  labelText: "Square Ft",
                  controller: controller.propertySqrFtEC,
                  focusNode: controller.propertySqrFtFN,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ),
          ],
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: 55,
          child: AndroidTextFormField(
            labelText: "Pricing",
            controller: controller.propertyPricingEC,
            focusNode: controller.propertyPricingFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            validator: (value) {
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Obx(() {
          return CheckboxListTile(
            value: controller.isNegotiable.value,
            activeColor: colorScheme.secondary,
            checkColor: kWhiteBackgroundColor,
            dense: true,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: const VisualDensity(
              horizontal: -4,
              vertical: 0,
            ),
            side: BorderSide(
              width: .6,
              color: colorScheme.primary,
            ),
            onChanged: (value) {
              controller.isNegotiable.value = !controller.isNegotiable.value;
            },
            title: Text(
              "Negotiable",
              style: defaultTextStyle(
                color: controller.isNegotiable.value
                    ? kFormFieldTextColor
                    : kFormFieldLabelTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: 120,
          child: Align(
            alignment: Alignment.topLeft,
            child: AndroidTextFormField(
              labelText: "Description",
              controller: controller.propertyDescriptionEC,
              focusNode: controller.propertyDescriptionFN,
              textInputAction: TextInputAction.newline,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              validator: (value) {
                return null;
              },
            ),
          ),
        ),
        kBigSizedBox,
        Text(
          "Property Address",
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: 55,
          child: AndroidTextFormField(
            labelText: "Address",
            controller: controller.propertyAddressEC,
            focusNode: controller.propertyAddressFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        Row(
          children: [
            Expanded(
              child: selectPropertyStateDropdownMenu(
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
                containerHeight: 55,
                child: AndroidTextFormField(
                  labelText: "Locality",
                  controller: controller.propertyLocalityEC,
                  focusNode: controller.propertyLocalityFN,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        kSizedBox,
      ],
    ),
  );
}
