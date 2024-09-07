import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/controllers/app/profile_screen_controller.dart';
import '../../../../theme/colors.dart';

class SelectProfilePicModal extends GetView<ProfileScreenController> {
  const SelectProfilePicModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: media.width,
      padding: const EdgeInsets.all(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              uploadProfilePicOption(
                colorScheme,
                onTap: controller.uploadProfilePicWithCamera,
                icon: Assets.cameraOutlineSvg,
                label: "Camera",
              ),
              kWidthSizedBox,
              uploadProfilePicOption(
                colorScheme,
                onTap: controller.uploadProfilePicWithGallery,
                icon: Assets.imageOutlineSvg,
                label: "Gallery",
              ),
            ],
          ),
        ],
      ),
    );
  }

  uploadProfilePicOption(
    ColorScheme colorScheme, {
    void Function()? onTap,
    String? icon,
    String? label,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 60,
            width: 60,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  width: 0.5,
                  color: colorScheme.primary,
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon ?? "",
                color: kAccentColor,
              ),
            ),
          ),
        ),
        kHalfSizedBox,
        Text(
          label ?? "",
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
