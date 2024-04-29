import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/components/auth_app_bar.dart';
import 'package:kribb/app/kyc/kyc_profile_photo/content/kyc_profile_photo_page_header.dart';
import 'package:kribb/src/controllers/kyc_profile_photo_controller.dart';
import 'package:kribb/src/utils/buttons/android/android_elevated_button.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../src/constants/consts.dart';
import 'kyc_profile_photo_modal_sheet.dart';

class KycProfilePhotoScaffold extends GetView<KycProfilePhotoController> {
  const KycProfilePhotoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycProfilePhotoController = KycProfilePhotoController.instance;

    return Scaffold(
      appBar: authAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "Profile",
        faIcon: FaIcon(
          FontAwesomeIcons.solidCircleUser,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycProfilePhotoPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Upload your profile photo",
              subtitle: "Grant Kribb access to Camera to upload your picture.",
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
                        "",
                        style: defaultTextStyle(
                          fontSize: 32.0,
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
                  kycProfilePhotoModalSheet(
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
                      FaIcon(
                        FontAwesomeIcons.circlePlus,
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
