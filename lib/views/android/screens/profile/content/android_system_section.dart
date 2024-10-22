import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/routes/routes.dart';
import 'package:suitess/views/android/screens/profile/content/android_profile_nav_option.dart';

systemSection(ColorScheme colorScheme) {
  return Container(
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1,
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        androidProfileNavOption(
          colorScheme,
          title: "FAQs",
          nav: () {
            Get.toNamed(
              Routes.faqs,
              preventDuplicates: true,
            );
          },
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        const SizedBox(height: 5),
        androidProfileNavOption(
          colorScheme,
          title: "Support and Feedback",
          nav: () {
            Get.toNamed(
              Routes.supportAndFeedback,
              preventDuplicates: true,
            );
          },
        ),
      ],
    ),
  );
}
