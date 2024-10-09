import 'package:flutter/material.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../src/controllers/app/privacy_and_security_controller.dart';
import '../../../../../../../theme/colors.dart';
import 'show_option_dialog.dart';

privacyOption(
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
      showOptionDialog(
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
