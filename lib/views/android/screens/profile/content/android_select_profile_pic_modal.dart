import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';

import '../../../../../constants/assets.dart';
import '../../../../../controllers/app/profile_screen_controller.dart';
import '../../../../../theme/colors.dart';
import 'android_upload_profile_pic_option.dart';

class AndroidSelectProfilePicModal extends GetView<ProfileScreenController> {
  const AndroidSelectProfilePicModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: media.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Upload profile picture",
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          kSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              androidUploadProfilePicOption(
                colorScheme,
                onTap: controller.requestCameraPermission,
                icon: Assets.cameraOutlineSvg,
                label: "Camera",
              ),
              kWidthSizedBox,
              androidUploadProfilePicOption(
                colorScheme,
                onTap: controller.requestGalleryPermission,
                icon: Assets.imageOutlineSvg,
                label: "Gallery",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
