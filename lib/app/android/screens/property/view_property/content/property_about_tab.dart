import 'package:flutter/material.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/app/view_property_controller.dart';
import '../../../../../../src/utils/buttons/android/android_outlined_button.dart';
import 'property_description.dart';
import 'property_facilities.dart';
import 'property_gallery.dart';
import 'property_images.dart';
import 'property_location_and_trade_type.dart';
import 'property_name_and_price.dart';
import 'property_price_flexibility.dart';
import 'section_header.dart';

aboutTab(
  ColorScheme colorScheme,
  Size media,
  ViewPropertyController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      propertyNameAndPrice(
        propertyName: "4 Flats Woodland Apartment",
        propertyPrice: 350000,
      ),
      const SizedBox(height: 5),
      propertyLocationAndTradeType(
        colorScheme,
        location: "Independence Layout, Enugu",
        tradeType: "Sale",
      ),
      kSizedBox,
      sectionHeader("Price Flexibility"),
      kHalfSizedBox,
      priceFlexibility(
        colorScheme,
        isNegotiable: true,
      ),
      kSizedBox,
      sectionHeader("Facilities"),
      kHalfSizedBox,
      propertyFacilities(
        colorScheme,
        numOfBeds: 4,
        numOfBaths: 2,
        numOfKitchens: 1,
        propertyMeasurement: 200,
      ),
      kSizedBox,
      sectionHeader("Description"),
      kHalfSizedBox,
      propertyDescription(
        colorScheme,
        descriptionText:
            "4 flats with 4 bedroom each. 1750sqm along the major tarred road between T-junction and Nike Lake Resort Hotel. Good for commercial purposes with certificate of occupancy (C of O).",
      ),
      kSizedBox,
      propertyGallery(
        colorScheme,
        viewAll: () {},
      ),
      kHalfSizedBox,
      propertyImages(
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
