import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../src/constants/assets.dart';
import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../theme/colors.dart';

ObstructingPreferredSizeWidget landLordHomeScreenCupertinoNavBar(
  colorScheme,
  media, {
  location,
  goToLocation,
  goToProfile,
  goToNotifications,
}) {
  return CupertinoNavigationBar(
    backgroundColor: colorScheme.background,
    border: Border.all(color: kTransparentColor),
    transitionBetweenRoutes: true,
    automaticallyImplyLeading: true,
    leading: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: media.width - 190,
      decoration: ShapeDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: CupertinoButton(
        onPressed: goToLocation ?? () {},
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(24),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.earthAfrica,
              color: colorScheme.inversePrimary,
              size: 20.0,
            ),
            kHalfWidthSizedBox,
            SizedBox(
              width: media.width - 250,
              child: Text(
                location,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 10.0,
                  color: colorScheme.primary,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    trailing: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CupertinoButton(
          onPressed: goToProfile ?? () {},
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 40,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                backgroundColor: colorScheme.inversePrimary,
                radius: 64,
                foregroundImage:
                    const NetworkImage(Assets.userPlaceholderImage),
                child: Text(
                  "P",
                  style: defaultTextStyle(
                    fontSize: 32.0,
                    color: kLightBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        kHalfWidthSizedBox,
        Container(
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(color: colorScheme.inversePrimary),
            ),
          ),
          child: CupertinoButton(
            onPressed: goToNotifications ?? () {},
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            minSize: 38,
            borderRadius: BorderRadius.circular(100),
            child: Stack(
              children: [
                Icon(
                  Iconsax.notification,
                  color: colorScheme.primary.withOpacity(0.9),
                  size: 18,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: ShapeDecoration(
                      color: kErrorColor,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
