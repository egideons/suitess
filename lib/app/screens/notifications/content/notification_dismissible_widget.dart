import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

notificationDismissibleWidget(
  colorScheme,
  media, {
  onDismissed,
  Future<bool?> Function(DismissDirection)? confirmDismiss,
  notificationColor,
  notificationMessage,
  notificationTime,
}) {
  return Dismissible(
    key: GlobalKey(),
    direction: DismissDirection.endToStart,
    onDismissed: onDismissed ?? (direction) {},
    confirmDismiss: confirmDismiss,
    background: Container(
      decoration: BoxDecoration(color: colorScheme.surface),
      width: media.width,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: kRedColor,
            shape: const CircleBorder(),
          ),
          child: Icon(
            Iconsax.trash,
            color: kLightBackgroundColor,
          ),
        ),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(20),
      width: media.width,
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.1),
            offset: const Offset(4, 10),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: notificationColor ?? colorScheme.inversePrimary,
            ),
          ),
          kHalfWidthSizedBox,
          Column(
            children: [
              SizedBox(
                width: media.width / 1.4,
                child: ReadMoreText(
                  notificationMessage ?? "",
                  trimMode: TrimMode.Line,
                  trimLines: 4,
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: media.width / 1.4,
                child: Text(
                  notificationTime ?? "",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.normal,
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
