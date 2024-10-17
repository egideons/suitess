import 'package:flutter/material.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/view_property_controller.dart';
import '../../../../../../utils/buttons/android/android_outlined_button.dart';
import 'android_view_property_description.dart';
import 'android_view_property_facilities.dart';
import 'android_view_property_gallery.dart';
import 'android_view_property_images.dart';
import 'android_view_property_location_and_trade_type.dart';
import 'android_view_property_name_and_price.dart';
import 'android_view_property_price_flexibility.dart';
import 'android_view_property_section_header.dart';

androidViewPropertyAboutTab(
  ColorScheme colorScheme,
  Size media,
  ViewPropertyController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      androidViewPropertyNameAndPrice(
        propertyName: "4 Flats Woodland Apartment",
        propertyPrice: 350000,
      ),
      const SizedBox(height: 5),
      androidViewPropertyLocationAndTradeType(
        colorScheme,
        location: "Independence Layout, Enugu",
        tradeType: "Sale",
      ),
      kSizedBox,
      androidViewPropertySectionHeader("Price Flexibility"),
      kHalfSizedBox,
      androidViewPropertyPriceFlexibility(
        colorScheme,
        isNegotiable: true,
      ),
      kSizedBox,
      androidViewPropertySectionHeader("Facilities"),
      kHalfSizedBox,
      androidViewPropertyFacilities(
        colorScheme,
        numOfBeds: 4,
        numOfBaths: 2,
        numOfKitchens: 1,
        propertyMeasurement: 200,
      ),
      kSizedBox,
      androidViewPropertySectionHeader("Description"),
      kHalfSizedBox,
      androidViewPropertyDescription(
        colorScheme,
        descriptionText:
            "4 flats with 4 bedroom each. 1750sqm along the major tarred road between T-junction and Nike Lake Resort Hotel. Good for commercial purposes with certificate of occupancy (C of O).",
      ),
      kSizedBox,
      androidViewPropertyGallery(
        colorScheme,
        viewAll: () {},
      ),
      kHalfSizedBox,
      androidViewPropertyImages(
        media,
        colorScheme,
        controller,
      ),
      kSizedBox,
      AndroidOutlinedButton(
        title: "Purchase Property",
        textColor: colorScheme.secondary,
        borderColor: colorScheme.secondary,
        borderWidth: 1,
        onPressed: controller.toPurchaseProperty,
      ),
    ],
  );
}
