import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/notifications_settings_controller.dart';
import '../../../../../../../theme/colors.dart';

toggleOption(
    NotificationsSettingsController controller, ColorScheme colorScheme,
    {String? title, bool? value, void Function(bool)? onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            color: kTextGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          value: value ?? false,
          onChanged: onChanged ?? (value) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: colorScheme.secondary,
          thumbColor: WidgetStatePropertyAll(
            value ?? false
                ? kWhiteBackgroundColor
                : colorScheme.inversePrimary.withOpacity(.6),
          ),
          activeTrackColor: colorScheme.secondary,
          inactiveTrackColor: colorScheme.inversePrimary.withOpacity(.2),
          trackOutlineColor: WidgetStatePropertyAll(
            colorScheme.inversePrimary.withOpacity(.2),
          ),
          trackOutlineWidth: const WidgetStatePropertyAll(.4),
          mouseCursor: SystemMouseCursors.click,
        ),
      ],
    ),
  );
}
