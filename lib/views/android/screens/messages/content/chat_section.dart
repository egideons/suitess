import 'package:flutter/material.dart';

import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/components/circle_avatar_image.dart';

chatSection(
  ColorScheme colorScheme, {
  void Function()? onTap,
  String? userName,
  String? message,
  DateTime? time,
  int? numOfUnreadMsgs = 0,
}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap ?? () {},
        leading: Stack(
          children: [
            circleAvatarImage(colorScheme, height: 50),
            Positioned(
              right: 0,
              top: 2,
              child: Container(
                height: 12,
                width: 12,
                decoration: ShapeDecoration(
                  color: colorScheme.secondary,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: kWhiteBackgroundColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          userName ?? "",
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          children: [
            Text(
              message ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Text(
              format12HrTime(time ?? DateTime.now()),
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            kHalfSizedBox,
            numOfUnreadMsgs == 0
                ? const SizedBox()
                : Container(
                    height: 22,
                    width: 22,
                    decoration: ShapeDecoration(
                      color: colorScheme.secondary,
                      shape: const CircleBorder(),
                    ),
                    child: Center(
                      child: Text(
                        (numOfUnreadMsgs ?? 0) > 10
                            ? "${intFormattedText(10)}+"
                            : intFormattedText(numOfUnreadMsgs ?? 0),
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          color: kTextWhiteColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      Divider(
        height: 0,
        thickness: 0,
        color: colorScheme.inversePrimary.withOpacity(.6),
        indent: 72,
        endIndent: 20,
      ),
    ],
  );
}
