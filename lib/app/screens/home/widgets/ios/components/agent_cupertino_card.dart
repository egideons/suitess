import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/utils/components/circle_avatar_image.dart';
import '../../../../../../theme/colors.dart';

Widget landLordAgentBidCupertinoCard(
  colorScheme,
  media,
  controller, {
  agentName,
  navTo,
  nameOfProperty,
  addressOfProperty,
  priceOfProperty,
}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    width: media.width,
    curve: Curves.easeInOut,
    padding: const EdgeInsets.all(20),
    decoration: ShapeDecoration(
      color: kGreenCardColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                circleAvatarImage(colorScheme, height: 60.0),
                kHalfWidthSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: media.width / 3,
                      child: Text(
                        agentName ?? "",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: defaultTextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "Agent",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        color: colorScheme.inversePrimary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CupertinoButton(
              onPressed: navTo ?? () {},
              padding: const EdgeInsets.all(0),
              // alignment: Alignment.centerRight,
              // minSize: media.height * .028,
              child: Icon(
                Iconsax.arrow_right,
                color: colorScheme.primary,
                size: 28,
              ),
            ),
          ],
        ),
        kSizedBox,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: kGreenCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
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
                    children: [
                      SizedBox(
                        width: media.width / 3,
                        child: Text(
                          nameOfProperty ?? "",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: kLightBackgroundColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: media.width / 3,
                        child: Text(
                          addressOfProperty ?? "",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: kLightBackgroundColor.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: media.width / 3.2,
                child: Text(
                  priceOfProperty ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: defaultTextStyle(
                    color: kLightBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        kSizedBox,
        Center(
          child: CupertinoButton(
            onPressed: controller.hideAvailableAgents,
            padding: const EdgeInsets.all(0),
            minSize: media.height * .02,
            borderRadius: BorderRadius.circular(100),
            child: const Icon(Iconsax.close_circle),
          ),
        ),
      ],
    ),
  );
}
