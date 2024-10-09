import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitess/controllers/app/view_property_controller.dart';
import 'package:suitess/views/android/screens/property/view_property/content/agent_statement.dart';
import 'package:suitess/views/android/screens/property/view_property/content/section_header.dart';
import 'package:suitess/views/android/screens/property/view_property/content/user_review.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/components/circle_avatar_image.dart';
import 'reviews_header.dart';

agentTab(
  ColorScheme colorScheme,
  Size media,
  ViewPropertyController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              circleAvatarImage(
                colorScheme,
              ),
              kHalfWidthSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ifeanyi Okigbo",
                        style: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(Assets.goldenTickSvg)
                    ],
                  ),
                  Text(
                    "Realtor",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.chatFilledIconSvg,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  Text(
                    "Message",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              kWidthSizedBox,
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.phoneFilledSvg,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  Text(
                    "Call",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      kSizedBox,
      sectionHeader("Agent Statement"),
      kHalfSizedBox,
      agentStatement(
        colorScheme,
        statement:
            "This building/apartment has been verified by our agent. The images in the gallery accurately reflect the physical apartment.",
      ),
      kSizedBox,
      reviewsHeader(
        colorScheme,
        numOfReviews: 18,
        review: () {},
      ),
      kHalfSizedBox,
      ListView.separated(
        itemCount: 18,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              kHalfSizedBox,
              Divider(
                color: colorScheme.inversePrimary,
                thickness: .5,
              ),
              kHalfSizedBox,
            ],
          ),
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      circleAvatarImage(
                        colorScheme,
                      ),
                      kHalfWidthSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yul George",
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            formatDate(DateTime.now()),
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: index < 4
                              ? kStarColor
                              : colorScheme.inversePrimary,
                        );
                      },
                    ),
                  ),
                ],
              ),
              kHalfSizedBox,
              userReview(
                colorScheme,
                statement:
                    "\"When it comes to helping a startup like mine scale, they excel, demonstrating an impressive level of responsiveness to cater to..\""
                    "",
              ),
            ],
          );
        },
      )
    ],
  );
}
