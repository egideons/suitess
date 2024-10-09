import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../src/constants/assets.dart';
import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../src/utils/components/circle_avatar_image.dart';
import '../../../../../../../theme/colors.dart';

Widget propertyDetailCupertinoButton(
  media,
  colorScheme, {
  nameOfProperty,
  addressOfProperty,
  goBackToProperty,
}) {
  return CupertinoButton(
    onPressed: goBackToProperty ?? () {},
    padding: const EdgeInsets.all(20),
    color: kDarkGreyColor,
    borderRadius: BorderRadius.circular(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            circleAvatarImage(
              colorScheme,
              foregroundImage: const AssetImage(Assets.buildings),
            ),
            kHalfWidthSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: media.width / 2,
                  child: Text(
                    nameOfProperty ?? "",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      color: kWhiteBackgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: media.width / 2,
                  child: Text(
                    addressOfProperty ?? "",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      color: kWhiteBackgroundColor.withOpacity(0.8),
                      fontWeight: FontWeight.w700,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(
          Iconsax.arrow_right,
          color: kWhiteBackgroundColor,
        ),
      ],
    ),
  );
}
