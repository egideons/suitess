import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/privacy_and_security_controller.dart';
import '../../../../../../../theme/colors.dart';
import 'android_show_option_dialog.dart';

androidPrivacyOption(
  ColorScheme colorScheme,
  BuildContext context,
  PrivacyAndSecurityController controller, {
  void Function()? onTapPrivate,
  void Function()? onTapPublic,
  String? title,
  bool? isPublic,
  bool? isPrivate,
}) {
  return ListTile(
    onTap: () {
      androidShowOptionDialog(
        colorScheme,
        context,
        controller: controller,
        isPublic: isPublic,
        isPrivate: isPrivate,
        onTapPrivate: onTapPrivate ?? () {},
        onTapPublic: onTapPublic ?? () {},
      );
    },
    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    title: Text(
      title ?? "",
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: defaultTextStyle(
        color: kTextGreyColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isPublic ?? false ? "Public" : "Private",
          style: defaultTextStyle(
            fontSize: 12,
            color: kTextBoldHeadingColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: colorScheme.inversePrimary,
        ),
      ],
    ),
  );
}
