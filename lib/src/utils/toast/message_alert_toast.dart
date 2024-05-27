import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../theme/colors.dart';
import '../../constants/assets.dart';

class MessageAlertToast extends StatelessWidget {
  final String title, message;
  final Color color;
  const MessageAlertToast({
    super.key,
    required this.title,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return ToastCard(
      color: colorScheme.surface,
      leading: Image.asset(
        Get.isDarkMode ? Assets.lightAppLogo : Assets.darkAppLogo,
        color: kPrimaryColor,
      ),
      title: Text(
        title,
        style: defaultTextStyle(
          fontWeight: FontWeight.w900,
          color: color,
          fontSize: 14,
          letterSpacing: -0.40,
        ),
      ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: defaultTextStyle(
          fontWeight: FontWeight.w800,
          color: colorScheme.inversePrimary,
          fontSize: 14,
          letterSpacing: -0.40,
        ),
      ),
    );
  }
}
