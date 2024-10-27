import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/kyc/kyc_profile_photo_controller.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/containers/form_field_container.dart';
import 'package:suitess/views/android/auth/components/auth_app_bar.dart';
import 'package:suitess/views/android/kyc/kyc_profile_photo/content/android_kyc_profile_photo_page_header.dart';

import '../../../../../constants/consts.dart';
import 'android_kyc_profile_photo_modal_sheet.dart';

class AndroidKycProfilePhotoScaffold
    extends GetView<KycProfilePhotoController> {
  const AndroidKycProfilePhotoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    var kycProfilePhotoController = KycProfilePhotoController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidAuthAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "Profile",
        icon: Icon(
          Icons.person,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            androidKycProfilePhotoPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Upload your profile photo",
              subtitle:
                  "Grant Suitess access to Camera to upload your picture.",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundColor: colorScheme.inversePrimary,
                      radius: 64,
                      foregroundImage: kycProfilePhotoController
                                  .selectedProfileImage.value !=
                              null
                          ? FileImage(
                              File(
                                kycProfilePhotoController
                                    .selectedProfileImage.value!.path,
                              ),
                            )
                          : null,
                      child: Text(
                        "P",
                        style: defaultTextStyle(
                          fontSize: 32.0,
                          color: kWhiteBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            formFieldContainer(
              colorScheme,
              media,
              containerHeight: media.height * 0.08,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  androidKycProfilePhotoModalSheet(
                    context,
                    media,
                    colorScheme,
                    kycProfilePhotoController,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: colorScheme.inversePrimary,
                      ),
                      kWidthSizedBox,
                      Text(
                        "Upload Photo",
                        style: defaultTextStyle(
                          fontSize: 14.0,
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<KycProfilePhotoController>(
              init: KycProfilePhotoController(),
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Continue",
                  disable:
                      kycProfilePhotoController.selectedProfileImage.value ==
                          null,
                  isLoading: kycProfilePhotoController.isLoading.value,
                  onPressed: kycProfilePhotoController.submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
