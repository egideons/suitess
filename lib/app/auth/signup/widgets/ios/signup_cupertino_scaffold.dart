import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

class SignupCupertinoScaffold extends StatelessWidget {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: kTransparentColor),
        middle: Container(
          width: media.width - 250,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.key,
                  color: kSuccessColor,
                  size: 12,
                ),
                kHalfWidthSizedBox,
                Text(
                  "Create account",
                  style: defaultTextStyle(color: kSuccessColor),
                ),
              ],
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            signupPageHeader(colorScheme: colorScheme, media: media),
          ],
        ),
      ),
    );
  }
}
