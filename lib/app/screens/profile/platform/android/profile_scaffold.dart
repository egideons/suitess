import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/routes/routes.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/circle_avatar_image.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../src/controllers/app/profilescreen_controller.dart';
import '../../content/profile_nav_option.dart';
import '../../content/profile_section_header.dart';

class ProfileScreenScaffold extends GetView<ProfileScreenController> {
  const ProfileScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = ProfileScreenController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<ProfileScreenController>(
            init: ProfileScreenController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            circleAvatarImage(colorScheme, height: 120),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: kAccentColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: kLightBackgroundColor,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.cameraOutline,
                                    color: kLightBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kSizedBox,
                        Text(
                          "Francis Acoi",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: kTextBoldHeadingColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        kHalfSizedBox,
                        Text(
                          "UID: 2102446421",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  profileSectionHeader(title: "Account Information"),
                  kHalfSizedBox,
                  Container(
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
                        profileNavOption(
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
                        profileNavOption(
                          colorScheme,
                          title: "Password",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Account Type",
                          nav: () {},
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  profileSectionHeader(title: "My Properties"),
                  kHalfSizedBox,
                  Container(
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
                        profileNavOption(
                          colorScheme,
                          title: "My Business",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Recently Viewed",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Scheduled Appointments",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Transactions and Offers",
                          nav: () {},
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  profileSectionHeader(title: "Preferences and Settings"),
                  kHalfSizedBox,
                  Container(
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
                        profileNavOption(
                          colorScheme,
                          title: "Notifications",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Privacy and Security",
                          nav: () {},
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  profileSectionHeader(title: "System"),
                  kHalfSizedBox,
                  Container(
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
                        profileNavOption(
                          colorScheme,
                          title: "FAQs",
                          nav: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        const SizedBox(height: 5),
                        profileNavOption(
                          colorScheme,
                          title: "Support and Feedback",
                          nav: () {},
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  AndroidElevatedButton(
                    title: "Logout",
                    isRowVisible: true,
                    isSwitched: true,
                    buttonIcon: Icons.logout,
                    buttonIconColor: kLightBackgroundColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}