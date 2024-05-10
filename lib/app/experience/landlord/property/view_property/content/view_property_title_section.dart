import 'package:flutter/widgets.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

Widget viewPropertyTitleSection(
  media,
  colorScheme, {
  propertyName,
  propertyTag,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: media.width - 150,
        child: Text(
          propertyName ?? "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      Container(
        width: media.width / 4,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: kRedCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          propertyTag ?? "For Rent",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: kRedColor,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.40,
          ),
        ),
      ),
    ],
  );
}
