import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/profile_screen_controller.dart';
import 'package:suitess/models/user/user_model.dart';
import 'package:suitess/services/api/api_url.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/components/circle_avatar_image.dart';

userImageNameIDSection(ProfileScreenController controller,
    ColorScheme colorScheme, UserData? user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Obx(() {
        return Center(
          child: Stack(
            children: [
              controller.selectedProfileImage == null ||
                      controller.profilePicUploadIsCanceled.isTrue
                  ? circleAvatarImage(
                      colorScheme,
                      height: 120,
                      foregroundImage: user!.profileImage!.isEmpty
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
                          controller.selectedProfileImage!.path,
                        ),
                      ),
                    ),
              controller.selectedProfileImage == null ||
                      controller.profilePicIsUploaded.isTrue ||
                      controller.profilePicUploadIsCanceled.value
                  ? const SizedBox()
                  : AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
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
                  child: controller.isUploadingProfilePic.value
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: colorScheme.surface,
                          ),
                        )
                      : InkWell(
                          onTap: controller.selectedProfileImage == null ||
                                  controller.profilePicIsUploaded.isTrue ||
                                  controller.profilePicUploadIsCanceled.value
                              ? controller.showUploadProfilePicModal
                              : controller.uploadProfilePic,
                          borderRadius: BorderRadius.circular(20),
                          child: controller.selectedProfileImage == null ||
                                  controller.profilePicIsUploaded.isTrue ||
                                  controller.profilePicUploadIsCanceled.value
                              ? SvgPicture.asset(
                                  Assets.cameraOutlineSvg,
                                  color: kWhiteBackgroundColor,
                                )
                              : Icon(
                                  Icons.check,
                                  color: kWhiteBackgroundColor,
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
  );
}
