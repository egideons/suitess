import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

PreferredSizeWidget authAppBar({colorScheme, media, faIcon, title, isVisible}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: colorScheme.background,
    title: isVisible == false
        ? const SizedBox()
        : Container(
            width: media.width - 160,
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
                  faIcon ??
                      FaIcon(
                        FontAwesomeIcons.key,
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
