import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/responsive_constants.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../controllers/auth/email_otp_controller.dart';
import '../../../../../theme/colors.dart';
import 'android_email_otp_form_landscape.dart';
import 'android_email_otp_form_mobile.dart';
import 'android_email_otp_page_header.dart';

class AndroidEmailOTPScaffold extends GetView<EmailOTPController> {
  final String userEmail, userPhoneNumber;

  const AndroidEmailOTPScaffold({
    super.key,
    required this.userEmail,
    required this.userPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    var controller = EmailOTPController.instance;

    //Large screens or Mobile Landscape mode
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
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
                      androidEmailOTPPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                        title: "OTP verification",
                        subtitle:
                            "Enter the 6-digit verification code we sent to ",
                        email: userEmail,
                        otpOption: "Phone",
                        signupVia: controller.sendToPhone,
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
                      androidEmailOTPFormLandscape(
                        controller,
                        media,
                        context,
                      ),
                      kBigSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: controller.timerComplete.isTrue
                                  ? controller.requestOTP
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
                            () => controller.timerComplete.isTrue
                                ? const SizedBox()
                                : Text(
                                    "in ${controller.formatTime(controller.secondsRemaining.value)}s",
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
                      GetBuilder<EmailOTPController>(
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Verify",
                            isLoading:
                                controller.isLoading.value ? true : false,
                            disable:
                                controller.formIsValid.value ? false : true,
                            onPressed: controller.submitOTP,
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
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
            androidEmailOTPPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "OTP verification",
              subtitle: "Enter the 6-digit verification code we sent to ",
              email: userEmail,
              otpOption: "Phone",
              signupVia: controller.sendToPhone,
            ),
            const SizedBox(height: kDefaultPadding * 2),
            androidEmailOTPFormMobile(controller, media, context),
            kBigSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    onTap: controller.timerComplete.value
                        ? controller.requestOTP
                        : null,
                    borderRadius: BorderRadius.circular(8),
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
                  () => controller.timerComplete.isTrue
                      ? const SizedBox()
                      : Text(
                          "in ${controller.formatTime(controller.secondsRemaining.value)}s",
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
            GetBuilder<EmailOTPController>(
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Verify",
                  isLoading: controller.isLoading.value ? true : false,
                  disable: controller.formIsValid.value ? false : true,
                  onPressed: controller.submitOTP,
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
