import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../theme/colors.dart';

Widget homeScreenNoOfAvailableAgentsCupertinoCard(media,
    {onPressed, noOfAgents}) {
  return CupertinoButton(
    onPressed: onPressed ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(16),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: media.width,
      height: media.height * .09,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        color: kGreenCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: kGreenCardColor.withOpacity(0.4),
            offset: const Offset(0, -20),
            spreadRadius: -10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: kLightBackgroundColor.withOpacity(0.4),
              shape: const CircleBorder(),
            ),
            child: Center(
              child: Icon(
                Iconsax.profile_2user5,
                color: kLightBackgroundColor,
              ),
            ),
          ),
          kHalfWidthSizedBox,
          SizedBox(
            width: media.width * .09,
            child: Text(
              intFormattedText(noOfAgents ?? 57),
              style: defaultTextStyle(
                color: kTextWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
              ),
            ),
          ),
          kHalfWidthSizedBox,
          SizedBox(
            width: media.width * .5,
            child: Text(
              "Agents \nare available right now!",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: defaultTextStyle(
                color: kTextWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
