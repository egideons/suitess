import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/main.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/routes/routes.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/circle_avatar_image.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../src/controllers/app/profile_screen_controller.dart';
import '../../../../../src/controllers/auth/user_controller.dart';
import '../../content/profile_nav_option.dart';
import '../../content/profile_section_header.dart';

class ProfileScreenScaffold extends GetView<ProfileScreenController> {
  const ProfileScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;
    var hasBusiness = prefs.getBool("hasBusiness") ?? false;

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
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          controller.selectedProfileImage == null
                              ? circleAvatarImage(
                                  colorScheme,
                                  height: 120,
                                  imageText: user!.firstName!.isEmpty
                                      ? ""
                                      : getNameInitials(user.fullname!),
                                )
                              : circleAvatarImage(
                                  colorScheme,
                                  height: 120,
                                  foregroundImage: FileImage(
                                    File(controller.selectedProfileImage!.path),
                                  ),
                                ),
                          Positioned(
                            bottom: 0,
                            right: 0,
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
                              child: Obx(
                                () {
                                  return controller.isUploadingProfilePic.value
                                      ? SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            color: colorScheme.surface,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: controller
                                                          .selectedProfileImage ==
                                                      null ||
                                                  controller
                                                      .profilePicIsUploaded
                                                      .isTrue
                                              ? controller
                                                  .showUploadProfilePicModal
                                              : controller.uploadProfilePic,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child:
                                              controller.selectedProfileImage ==
                                                          null ||
                                                      controller
                                                          .profilePicIsUploaded
                                                          .isTrue
                                                  ? SvgPicture.asset(
                                                      Assets.cameraOutlineSvg,
                                                      color:
                                                          kLightBackgroundColor,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      color:
                                                          kLightBackgroundColor,
                                                    ),
                                        );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      kSizedBox,
                      Text(
                        user!.fullname!,
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
                        profileNavOption(
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
                          nav: () {
                            hasBusiness
                                ? Get.toNamed(
                                    Routes.myBusiness,
                                    preventDuplicates: true,
                                  )
                                : Get.toNamed(
                                    Routes.businessIntro,
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
                        profileNavOption(
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
                        profileNavOption(
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
                        profileNavOption(
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
                        profileNavOption(
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
                  ),
                  kSizedBox,
                  AndroidElevatedButton(
                    title: "Logout",
                    isRowVisible: true,
                    isSwitched: true,
                    buttonIcon: Icons.logout,
                    buttonIconColor: kLightBackgroundColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onPressed: controller.logout,
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
