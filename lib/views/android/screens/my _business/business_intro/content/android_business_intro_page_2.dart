import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/business_intro_controller.dart';
import '../../../../../../theme/colors.dart';
import 'android_business_category_option.dart';

androidBusinessIntroPage2(
  Size media,
  ColorScheme colorScheme,
  BusinessIntroController controller,
) {
  return ListView(
    // mainAxisAlignment: MainAxisAlignment.start,
    padding: const EdgeInsets.all(10),
    children: [
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        leading: IconButton(
          onPressed: controller.navigateToPreviousPage,
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        horizontalTitleGap: (media.width - 280) / 1.2,
        title: Text(
          "My Business",
          maxLines: 10,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      kSizedBox,
      Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: .5,
              color: colorScheme.inversePrimary.withOpacity(.4),
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              "Choose your preferred business category",
              textAlign: TextAlign.center,
              maxLines: 10,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            kSizedBox,
            FadeInUp(
              child: androidBusinessCategoryOption(
                colorScheme,
                onTap: () {
                  controller.navigateToPage3(true);
                },
                image: Assets.landsAndPropertiesPng,
                title: "Lands and Properties",
                subtitle:
                    "Advertise and manage sales, rentals, or leases for lands, apartments, workspaces, shops, and more.",
              ),
            ),
            kSizedBox,
            FadeInUp(
              child: androidBusinessCategoryOption(
                colorScheme,
                onTap: () {
                  controller.navigateToPage3(false);
                },
                image: Assets.hotelBuildingPng,
                title: "Hotel Management",
                subtitle:
                    "List your hotels for bookings and manage all your hotel activities effortlessly.",
              ),
            ),
            kSizedBox,
          ],
        ),
      )
    ],
  );
}
