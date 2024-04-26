import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

Widget forgotPasswordCupertinoButton(
  media,
  onPressed, {
  title,
  bgColor,
  faIcon,
  titleColor,
  iconColor,
}) {
  return Container(
    width: media.width,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      color: bgColor ?? kSuccessColor.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: CupertinoButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          faIcon ??
              FaIcon(
                FontAwesomeIcons.buildingUser,
                color: kLightBackgroundColor,
              ),
          SizedBox(
            width: media.width / 2,
            child: Text(
              title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 16.0,
                color: titleColor ?? kLightBackgroundColor,
              ),
            ),
          ),
          kWidthSizedBox,
          kWidthSizedBox,
          FaIcon(
            FontAwesomeIcons.chevronRight,
            color: iconColor ?? kLightBackgroundColor,
            size: 16,
          )
        ],
      ),
    ),
  );
}
