import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../../src/utils/components/responsive_constants.dart';
import '../../../../../../../../theme/colors.dart';

viewPropertyCupertinoNavBar(
  colorScheme,
  media, {
  previousPageTitle,
  deleteFunction,
}) {
  return CupertinoNavigationBar(
    previousPageTitle: previousPageTitle ?? "",
    transitionBetweenRoutes: true,
    backgroundColor: colorScheme.surface,
    border: Border.all(color: colorScheme.surface),
    trailing: Container(
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: kRedCardColor,
        shape: const CircleBorder(),
      ),
      child: CupertinoButton(
        onPressed: deleteFunction ?? () {},
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(100),
        padding: const EdgeInsets.all(0),
        minSize: 5,
        child: Icon(
          Iconsax.trash,
          color: kErrorColor,
          size: deviceType(media.width) > 2 ? 30 : 20,
        ),
      ),
    ),
  );
}
