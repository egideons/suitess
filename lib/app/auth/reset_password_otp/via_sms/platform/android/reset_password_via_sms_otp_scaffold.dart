import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../../../../../../src/utils/components/responsive_constants.dart';
import '../../../../../../theme/colors.dart';
import '../../content/reset_password_via_sms_otp_form_landscape.dart';
import '../../content/reset_password_via_sms_otp_form_mobile.dart';
import '../../content/reset_password_via_sms_page_header.dart';

class ResetPasswordViaSMSOTPScaffold
    extends GetView<ResetPasswordViaSmsOTPController> {
  const ResetPasswordViaSMSOTPScaffold(
      {required this.userPhoneNumber, super.key});

  final String userPhoneNumber;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var resetPasswordViaSmsController =
        ResetPasswordViaSmsOTPController.instance;

    resetPasswordViaSmsController.phoneEC.text = userPhoneNumber;

    //Large screens or Mobile Landscape mode
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          toolbarHeight: 32,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Iconsax.arrow_left_2,
              color: colorScheme.primary,
            ),
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: media.width / 2.2,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.otpSvg,
                        fit: BoxFit.cover,
                        height: deviceType(media.width) > 2
                            ? media.height * .4
                            : media.height * .2,
                      ),
                      kSizedBox,
                      resetPasswordViaSMSOTPPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                        title: "OTP Verification",
                        subtitle:
                            "Enter the 6-digit verification code sent to ",
                        phoneNumber: maskPhoneNumber(userPhoneNumber),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,

            //OTP Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: kDefaultPadding * 4),
                      resetPasswordViaSmsOTPFormLandscape(
                        resetPasswordViaSmsController,
                        media,
                        context,
                      ),
                      kSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: resetPasswordViaSmsController
                                      .timerComplete.isTrue
                                  ? resetPasswordViaSmsController.requestOTP
                                  : null,
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                style: defaultTextStyle(
                                  fontSize: 15.0,
                                  color: kSuccessColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                child: const Text("Resend code"),
                              ),
                            ),
                          ),
                          kHalfWidthSizedBox,
                          Obx(
                            () => resetPasswordViaSmsController
                                    .timerComplete.isTrue
                                ? const SizedBox()
                                : Text(
                                    "in ${resetPasswordViaSmsController.formatTime(resetPasswordViaSmsController.secondsRemaining.value)}s",
                                    textAlign: TextAlign.center,
                                    style: defaultTextStyle(
                                      fontSize: 15.0,
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<ResetPasswordViaSmsOTPController>(
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Verify",
                            isLoading:
                                resetPasswordViaSmsController.isLoading.value
                                    ? true
                                    : false,
                            disable:
                                resetPasswordViaSmsController.formIsValid.value
                                    ? false
                                    : true,
                            onPressed: resetPasswordViaSmsController.submitOTP,
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    //Portrait mode for Mobile Screens
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Iconsax.arrow_left_2,
            color: colorScheme.primary,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SvgPicture.asset(
            Assets.otpSvg,
            fit: BoxFit.fitHeight,
            height: media.height * .2,
          ),
          resetPasswordViaSMSOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "OTP Verification",
            subtitle: "Enter the 6-digit verification code sent to ",
            phoneNumber: maskPhoneNumber(userPhoneNumber),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          resetPasswordViaSmsOTPFormMobile(
            resetPasswordViaSmsController,
            media,
            context,
          ),
          kSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: resetPasswordViaSmsController.timerComplete.isTrue
                      ? resetPasswordViaSmsController.requestOTP
                      : null,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    style: defaultTextStyle(
                      fontSize: 15.0,
                      color: kSuccessColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    child: const Text("Resend code"),
                  ),
                ),
              ),
              kHalfWidthSizedBox,
              Obx(
                () => resetPasswordViaSmsController.timerComplete.isTrue
                    ? const SizedBox()
                    : Text(
                        "in ${resetPasswordViaSmsController.formatTime(resetPasswordViaSmsController.secondsRemaining.value)}s",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          fontSize: 15.0,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          GetBuilder<ResetPasswordViaSmsOTPController>(
            builder: (controller) {
              return AndroidElevatedButton(
                title: "Verify",
                isLoading: resetPasswordViaSmsController.isLoading.value
                    ? true
                    : false,
                disable: resetPasswordViaSmsController.formIsValid.value
                    ? false
                    : true,
                onPressed: resetPasswordViaSmsController.submitOTP,
              );
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
