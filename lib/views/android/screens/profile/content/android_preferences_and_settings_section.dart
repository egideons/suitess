import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/routes/routes.dart';
import 'package:suitess/views/android/screens/profile/content/android_profile_nav_option.dart';

preferencesAndSettingsSection(ColorScheme colorScheme) {
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
          title: "Notifications",
          nav: () {
            Get.toNamed(
              Routes.notificationsSettings,
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
          title: "Privacy and Security",
          nav: () {
            Get.toNamed(
              Routes.privacyAndSecurity,
              preventDuplicates: true,
            );
          },
        ),
      ],
    ),
  );
}
