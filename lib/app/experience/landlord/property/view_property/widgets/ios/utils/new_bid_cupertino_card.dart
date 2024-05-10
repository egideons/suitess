import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../src/utils/components/circle_avatar_image.dart';
import '../../../../../../../../theme/colors.dart';

Widget newBidCupertinoCard(
  colorScheme,
  media, {
  toBidDetails,
  bidSource,
  bidSourceUserName,
  bidPrice,
  dateOfBid,
  timeOfBid,
}) {
  return CupertinoButton(
    onPressed: toBidDetails ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(16),
    child: Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: kGreenCardColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bidSource ?? "".toUpperCase(),
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextWhiteColor,
                            fontSize: 10,
                          ),
                        ),
                        kHalfSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            circleAvatarImage(
                              colorScheme,
                            ),
                            kHalfWidthSizedBox,
                            SizedBox(
                              width: media.width / 3,
                              child: Text(
                                bidSourceUserName ?? "",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextWhiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price".toUpperCase(),
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: kTextWhiteColor,
                            fontSize: 10,
                          ),
                        ),
                        kSizedBox,
                        SizedBox(
                          width: media.width / 3,
                          child: Text(
                            "NGN ${doubleFormattedText(bidPrice ?? 0)}",
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: defaultTextStyle(
                              color: kTextWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: colorScheme.background,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(.1),
                  offset: const Offset(4, 10),
                  blurRadius: 10,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar5,
                      color: kGreenCardColor,
                      size: 14,
                    ),
                    kHalfWidthSizedBox,
                    SizedBox(
                      width: media.width / 3,
                      child: Text(
                        dateOfBid ?? "",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.clock5,
                      color: kGreenCardColor,
                      size: 14,
                    ),
                    kHalfWidthSizedBox,
                    SizedBox(
                      width: media.width / 3,
                      child: Text(
                        timeOfBid ?? "4:30 PM",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
