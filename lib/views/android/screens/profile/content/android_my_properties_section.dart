import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/models/user/user_model.dart';
import 'package:suitess/routes/routes.dart';
import 'package:suitess/views/android/screens/profile/content/android_profile_nav_option.dart';

myPropertiesSection(ColorScheme colorScheme, bool hasBusiness, UserData? user) {
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
          title: "My Business",
          nav: () {
            if (hasBusiness || user!.settings!.username!.isNotEmpty) {
              Get.toNamed(
                Routes.landsAndProperties,
                preventDuplicates: true,
              );
              // businessIsLandsAndProperties
              //     ? Get.toNamed(
              //         Routes.landsAndProperties,
              //         preventDuplicates: true,
              //       )
              //     : Get.toNamed(
              //         Routes.hotelManagement,
              //         preventDuplicates: true,
              //       );
            } else {
              Get.toNamed(
                Routes.businessIntro,
                preventDuplicates: true,
              );
            }
          },
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        const SizedBox(height: 5),
        androidProfileNavOption(
          colorScheme,
          title: "Recently Viewed",
          nav: () {
            // Get.toNamed(
            //   Routes.recentlyViewed,
            //   preventDuplicates: true,
            // );
          },
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        const SizedBox(height: 5),
        androidProfileNavOption(
          colorScheme,
          title: "Scheduled Appointments",
          nav: () {
            // Get.toNamed(
            //   Routes.scheduledAppointments,
            //   preventDuplicates: true,
            // );
          },
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        const SizedBox(height: 5),
        androidProfileNavOption(
          colorScheme,
          title: "Transactions and Offers",
          nav: () {
            // Get.toNamed(
            //   Routes.transactionsAndOffers,
            //   preventDuplicates: true,
            // );
          },
        ),
      ],
    ),
  );
}
