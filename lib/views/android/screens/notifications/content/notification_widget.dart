import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/utils/components/responsive_constants.dart';

notificationWidget(
  ColorScheme colorScheme,
  Size media, {
  String? notificationTitle,
  Color? notificationColor,
  String? notificationMessage,
  String? notificationTime,
  Function()? viewNotif,
  Function()? clearNotif,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 8,
              width: 8,
              margin: const EdgeInsets.only(right: 10, top: 6),
              alignment: Alignment.centerLeft,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: notificationColor ?? colorScheme.inversePrimary,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceType(media.width) > 1
                      ? media.width - 120
                      : media.width - 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        notificationTitle ?? "",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.primary.withOpacity(.5),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        notificationTime ?? "",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.primary.withOpacity(.5),
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: viewNotif ?? () {},
                      child: Text(
                        "View",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 3,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: colorScheme.primary.withOpacity(.5),
                      ),
                    ),
                    InkWell(
                      onTap: clearNotif ?? () {},
                      child: Text(
                        "Clear",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      kHalfSizedBox,
      Container(
        color: colorScheme.inversePrimary,
        width: media.width,
        height: .8,
      ),
      kHalfSizedBox,
    ],
  );
}
