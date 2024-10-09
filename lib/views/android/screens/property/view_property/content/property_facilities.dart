import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';

propertyFacilities(
  ColorScheme colorScheme, {
  int? numOfBeds,
  int? numOfBaths,
  int? numOfKitchens,
  int? propertyMeasurement,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          SvgPicture.asset(
            height: 20,
            width: 20,
            Assets.bedOutlineSvg,
            color: colorScheme.primary.withOpacity(.5),
            fit: BoxFit.contain,
          ),
          Text(
            "$numOfBeds Beds",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 12,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      Column(
        children: [
          SvgPicture.asset(
            height: 20,
            width: 20,
            Assets.bathOutlineSvg,
            color: colorScheme.primary.withOpacity(.5),
            fit: BoxFit.contain,
          ),
          Text(
            "$numOfBaths Baths",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 12,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      Column(
        children: [
          SvgPicture.asset(
            height: 20,
            width: 20,
            Assets.kitchenOutlineSvg,
            color: colorScheme.primary.withOpacity(.5),
            fit: BoxFit.contain,
          ),
          Text(
            "$numOfKitchens Kitchen",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 12,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      Column(
        children: [
          SvgPicture.asset(
            height: 20,
            width: 20,
            Assets.measureOutlineSvg,
            color: colorScheme.primary.withOpacity(.5),
            fit: BoxFit.contain,
          ),
          Text(
            "$propertyMeasurement Sqft",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 12,
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  );
}
