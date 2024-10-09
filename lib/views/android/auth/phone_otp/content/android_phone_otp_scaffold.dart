import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/auth/phone_otp/content/android_phone_otp_page_header.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/phone_otp_controller.dart';
import '../../../../../theme/colors.dart';
import 'android_phone_otp_form_landscape.dart';
import 'android_phone_otp_form_mobile.dart';

class AndroidPhoneOTPScaffold extends GetView<PhoneOTPController> {
  final String userPhoneNumber, userEmail;
  const AndroidPhoneOTPScaffold(
      {required this.userPhoneNumber, required this.userEmail, super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var otpController = PhoneOTPController.instance;

    //Large screens or Mobile Landscape mode
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: media.width / 2.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.otpSvg,
                    fit: BoxFit.cover,
                    height: deviceType(media.width) > 2
                        ? media.height * .6
                        : media.height * .4,
                  ),
                  kSizedBox,
                  androidPhoneOTPPageHeader(
                    colorScheme: colorScheme,
                    media: media,
                    title: "OTP verification",
                    subtitle: "Enter the 6-digit verification code we sent to ",
                    phoneNumber: maskPhoneNumber(userPhoneNumber),
                    otpOption: "Email",
                    signupVia: controller.sendToEmail,
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
                  margin: const EdgeInsets.only(right: 10),
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
                      androidPhoneOTPFormLandscape(
                          otpController, media, context),
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<PhoneOTPController>(
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Verify",
                            isLoading:
                                otpController.isLoading.value ? true : false,
                            disable:
                                otpController.formIsValid.value ? false : true,
                            onPressed: otpController.submitOTP,
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: otpController.timerComplete.isTrue
                                  ? otpController.requestOTP
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
                            () => otpController.timerComplete.isTrue
                                ? const SizedBox()
                                : Text(
                                    "in ${otpController.formatTime(otpController.secondsRemaining.value)}s",
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
                      const SizedBox(height: kDefaultPadding * 4),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    //Portrait mode for Mobile Screens
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SvgPicture.asset(
              Assets.otpSvg,
              fit: BoxFit.fitHeight,
              height: media.height * .2,
            ),
            kSizedBox,
            androidPhoneOTPPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "OTP verification",
              subtitle: "Enter the 6-digit verification code we sent to ",
              phoneNumber: maskPhoneNumber(userPhoneNumber),
              otpOption: "Email",
              signupVia: controller.sendToEmail,
            ),
            const SizedBox(height: kDefaultPadding * 2),
            androidPhoneOTPFormMobile(otpController, media, context),
            kBigSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    onTap: otpController.timerComplete.isTrue
                        ? otpController.requestOTP
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
                  () => otpController.timerComplete.isTrue
                      ? const SizedBox()
                      : Text(
                          "in ${otpController.formatTime(otpController.secondsRemaining.value)}s",
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
            GetBuilder<PhoneOTPController>(
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Verify",
                  isLoading: otpController.isLoading.value ? true : false,
                  disable: otpController.formIsValid.value ? false : true,
                  onPressed: otpController.submitOTP,
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
