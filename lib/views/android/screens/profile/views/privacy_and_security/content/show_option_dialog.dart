import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/privacy_and_security_controller.dart';
import '../../../../../../../theme/colors.dart';

showOptionDialog(
  ColorScheme colorScheme,
  BuildContext context, {
  void Function()? onTapPublic,
  void Function()? onTapPrivate,
  PrivacyAndSecurityController? controller,
  bool? isPublic,
  bool? isPrivate,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        children: [
          ListTile(
            onTap: onTapPublic ?? () {},
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              "Public",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                color: kTextGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: isPublic ?? false
                ? Icon(
                    Icons.check,
                    color: colorScheme.secondary,
                  )
                : const SizedBox(),
          ),
          Divider(
            color: colorScheme.inversePrimary.withOpacity(.4),
          ),
          ListTile(
            onTap: onTapPrivate ?? () {},
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              "Private",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                color: kTextGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: isPrivate ?? false
                ? Icon(
                    Icons.check,
                    color: colorScheme.secondary,
                  )
                : const SizedBox(),
          ),
        ],
      );
    },
  );
}
