import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../../src/constants/assets.dart';
import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../src/utils/components/circle_avatar_image.dart';
import '../../../../../../../../theme/colors.dart';

Widget listingAgentCupertinoButton(
  colorScheme,
  media, {
  goToListingAgent,
  agentImage,
  agentName,
}) {
  return CupertinoButton(
    onPressed: goToListingAgent ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(24),
    pressedOpacity: .6,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Listing Agent",
                style: defaultTextStyle(
                  fontSize: 10,
                  color: kGreyColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              kHalfSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  circleAvatarImage(
                    colorScheme,
                    foregroundImage: agentImage ??
                        const NetworkImage(Assets.userPlaceholderImage),
                  ),
                  kHalfWidthSizedBox,
                  SizedBox(
                    width: media.width - 200,
                    child: Text(
                      agentName ?? "",
                      style: defaultTextStyle(
                        fontSize: 14,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Iconsax.arrow_right,
            color: kDarkBackgroundColor,
          )
        ],
      ),
    ),
  );
}
