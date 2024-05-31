import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

forgotPasswordAndroidButton(
  media,
  onTap, {
  title,
  bgColor,
  faIcon,
  titleColor,
  iconColor,
  padding,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      width: media.width,
      padding: padding ?? const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: bgColor ?? kSuccessColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          faIcon ??
              Icon(
                Iconsax.message,
                color: kLightBackgroundColor,
              ),
          kHalfWidthSizedBox,
          Expanded(
            flex: 10,
            child: Text(
              title ?? "",
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 16.0,
                color: titleColor ?? kLightBackgroundColor,
              ),
            ),
          ),
          Expanded(
            child: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: iconColor ?? kLightBackgroundColor,
              size: 16,
            ),
          )
        ],
      ),
    ),
  );
}
