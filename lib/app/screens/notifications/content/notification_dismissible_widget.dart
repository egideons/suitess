import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

import '../../../../src/constants/consts.dart';

notificationWidget(
  colorScheme,
  media, {
  notificationColor,
  notificationMessage,
  notificationTime,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: media.width,
    decoration: ShapeDecoration(
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadows: [
        BoxShadow(
          color: colorScheme.inversePrimary.withOpacity(0.2),
          offset: const Offset(4, 10),
          blurRadius: 4,
          spreadRadius: 2,
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
  );
}
