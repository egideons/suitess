import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/routes/routes.dart';
import 'package:suitess/views/android/screens/profile/content/android_profile_nav_option.dart';

accountInformationSection(ColorScheme colorScheme) {
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
          title: "Contact Details",
          nav: () {
            Get.toNamed(
              Routes.contactDetails,
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
          title: "Password",
          nav: () {
            Get.toNamed(
              Routes.passwordSettings,
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
          title: "Wallet Information",
          nav: () {
            Get.toNamed(
              Routes.walletInformation,
              preventDuplicates: true,
            );
          },
        ),
      ],
    ),
  );
}
