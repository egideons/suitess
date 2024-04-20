import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/otp/content/otp_page_header.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/otp_controller.dart';
import '../../../../../theme/colors.dart';
import '../../../components/auth_cupertino_nav_bar.dart';

class OTPCupertinoScaffold extends StatelessWidget {
  const OTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final otpController = OTPController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "OTP",
      ),
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          otpPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "Email verification",
            subtitle: "Enter the 4-digit OTP sent to your email",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: otpController.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: const Column(
              children: [],
            ),
          ),
          kSizedBox,
          Text(
            "Expires in 2 minutes",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          kSizedBox,
          CupertinoButton(
            onPressed: () {},
            child: Center(
              child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: kSuccessColor,
                        size: 12,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        "Resend code",
                        style: defaultTextStyle(color: kSuccessColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
