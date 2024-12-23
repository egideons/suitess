import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/consts.dart';
import '../../../../theme/colors.dart';

androidAuthAppBar(
    {ColorScheme? colorScheme,
    Size? media,
    Icon? icon,
    String? title,
    bool? isVisible}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: colorScheme!.surface,
    title: isVisible == false
        ? const SizedBox()
        : Container(
            width: media!.width - 160,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Get.isDarkMode
                  ? kSuccessColor.withOpacity(0.2)
                  : kSuccessColor.withOpacity(0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ??
                      Icon(
                        Icons.key,
                        color: kSuccessColor,
                        size: 12,
                      ),
                  kHalfWidthSizedBox,
                  Text(
                    title ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(color: kSuccessColor),
                  ),
                ],
              ),
            ),
          ),
  );
}
