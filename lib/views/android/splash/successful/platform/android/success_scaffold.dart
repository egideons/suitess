import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/controllers/app/success_screen_controller.dart';

class SuccessScaffold extends GetView<SuccessScreenController> {
  final String? subtitle;
  final bool isWalletTab;
  const SuccessScaffold({this.isWalletTab = false, this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        toolBarHeight: 10,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            SizedBox(height: media.height * .12),
            Center(
              child: Icon(
                Icons.check_circle_rounded,
                color: colorScheme.secondary,
                size: media.height * .28,
              ),
            ),
            kBigSizedBox,
            Column(
              children: [
                Text(
                  "Success",
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                kSizedBox,
                SizedBox(
                  width: media.width - 50,
                  child: Text(
                    subtitle ??
                        "Your appointment has been booked with an agent/realtor successfully",
                    textAlign: TextAlign.center,
                    maxLines: 10,
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                kBigSizedBox,
                AndroidElevatedButton(
                  title: "Return Home",
                  onPressed: isWalletTab == true
                      ? controller.goToWalletTab
                      : controller.goHome,
                ),
                kBigSizedBox,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
