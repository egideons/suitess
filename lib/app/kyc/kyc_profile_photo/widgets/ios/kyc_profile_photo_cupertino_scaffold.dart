import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/kyc/kyc_profile_photo/content/kyc_profile_photo_page_header.dart';
import 'package:suitess/app/kyc/kyc_profile_photo/widgets/ios/kyc_profile_photo_cupertino_modal_popup.dart';
import 'package:suitess/src/controllers/kyc/kyc_profile_photo_controller.dart';
import 'package:suitess/src/utils/buttons/ios/cupertino_elevated_button.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../auth/components/auth_cupertino_nav_bar.dart';

class KycProfilePhotoCupertinoScaffold
    extends GetView<KycProfilePhotoController> {
  const KycProfilePhotoCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycProfilePhotoController = KycProfilePhotoController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "Profile",
        faIcon: Icon(
          Icons.person,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycProfilePhotoPageHeader(
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
              child: CupertinoButton(
                onPressed: () {
                  kycProfilePhotoCupertinoModalPopup(
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
                return CupertinoElevatedButton(
                  title: "Continue",
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
