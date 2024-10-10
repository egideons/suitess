import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/main.dart';
import 'package:suitess/routes/routes.dart';
import 'package:suitess/services/api/api_url.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/circle_avatar_image.dart';

import '../../../../../controllers/app/profile_screen_controller.dart';
import '../../../../../controllers/auth/user_controller.dart';
import 'android_profile_nav_option.dart';
import 'android_profile_section_header.dart';

class AndroidProfileScreenScaffold extends GetView<ProfileScreenController> {
  const AndroidProfileScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;
    var hasBusiness = prefs.getBool("hasBusiness") ?? false;
    // var businessIsLandsAndProperties =
    //     prefs.getBool("businessIsLandsAndProperties") ?? false;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<ProfileScreenController>(
            init: ProfileScreenController(),
            builder: (controller) {
              return SingleChildScrollView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Center(
                            child: Stack(
                              children: [
                                controller.selectedProfileImage == null ||
                                        controller
                                            .profilePicUploadIsCanceled.isTrue
                                    ? circleAvatarImage(
                                        colorScheme,
                                        height: 120,
                                        foregroundImage:
                                            user!.profileImage!.isEmpty
                                                ? null
                                                : NetworkImage(
                                                    "${ApiUrl.authBaseUrl}/public/storage/${user.profileImage!}",
                                                  ),
                                        imageText: user.firstName!.isEmpty
                                            ? ""
                                            : getNameInitials(user.fullname!),
                                      )
                                    : circleAvatarImage(
                                        colorScheme,
                                        height: 120,
                                        foregroundImage: FileImage(
                                          File(
                                            controller
                                                .selectedProfileImage!.path,
                                          ),
                                        ),
                                      ),
                                controller.selectedProfileImage == null ||
                                        controller
                                            .profilePicIsUploaded.isTrue ||
                                        controller
                                            .profilePicUploadIsCanceled.value
                                    ? const SizedBox()
                                    : AnimatedPositioned(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        bottom: 0,
                                        left: 0,
                                        child: InkWell(
                                          onTap: controller.cancelUpload,
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: colorScheme.error,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 2,
                                                color: kWhiteBackgroundColor,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: kWhiteBackgroundColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  bottom: 0,
                                  right: -0,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: kWhiteBackgroundColor,
                                      ),
                                    ),
                                    child: controller
                                            .isUploadingProfilePic.value
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
                                                        .isTrue ||
                                                    controller
                                                        .profilePicUploadIsCanceled
                                                        .value
                                                ? controller
                                                    .showUploadProfilePicModal
                                                : controller.uploadProfilePic,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: controller
                                                            .selectedProfileImage ==
                                                        null ||
                                                    controller
                                                        .profilePicIsUploaded
                                                        .isTrue ||
                                                    controller
                                                        .profilePicUploadIsCanceled
                                                        .value
                                                ? SvgPicture.asset(
                                                    Assets.cameraOutlineSvg,
                                                    color:
                                                        kWhiteBackgroundColor,
                                                  )
                                                : Icon(
                                                    Icons.check,
                                                    color:
                                                        kWhiteBackgroundColor,
                                                  ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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
                          // "UID: ${user.uid}",
                          "UID: ${user.settings!.userId}",
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
                    androidProfileSectionHeader(title: "Account Information"),
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
                    ),
                    kSizedBox,
                    androidProfileSectionHeader(title: "My Properties"),
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
                          androidProfileNavOption(
                            colorScheme,
                            title: "My Business",
                            nav: () {
                              if (hasBusiness ||
                                  user.settings!.username!.isNotEmpty) {
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
                    ),
                    kSizedBox,
                    androidProfileSectionHeader(
                        title: "Preferences and Settings"),
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
                    ),
                    kSizedBox,
                    androidProfileSectionHeader(title: "System"),
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
                    ),
                    kSizedBox,
                    AndroidElevatedButton(
                      title: "Logout",
                      isRowVisible: true,
                      isSwitched: true,
                      buttonIcon: Icons.logout,
                      buttonIconColor: kWhiteBackgroundColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      onPressed: controller.logout,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
