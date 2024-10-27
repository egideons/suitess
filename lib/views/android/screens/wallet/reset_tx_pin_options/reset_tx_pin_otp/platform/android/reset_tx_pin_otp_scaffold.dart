import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/reset_tx_pin_otp_controller.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/responsive_constants.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin_otp/content/reset_tx_pin_otp_form_landscape.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin_otp/content/reset_tx_pin_otp_form_mobile.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin_otp/content/reset_tx_pin_otp_page_header.dart';

class ResetTxPinOTPScaffold extends GetView<ResetTxPinOTPController> {
  const ResetTxPinOTPScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

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
                      resetTxPinOTPPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                        title: "Enter Verification Code",
                        subtitle: controller.resetOptionIsEmail == true
                            ? "We’ve sent a verification code to your email address. Please enter code below to continue."
                            : "We’ve sent a verification code to your mobile number. Please enter code below to continue.",
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
                      resetTxPinOTPFormLandscape(
                        controller,
                        media,
                        context,
                      ),
                      kSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: controller.timerComplete.isTrue
                                  ? controller.resetOptionIsEmail
                                      ? controller.requestOTPViaEmail
                                      : controller.requestOTPViaPhone
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
                      GetBuilder<ResetTxPinOTPController>(
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Verify",
                            isLoading:
                                controller.isLoading.value ? true : false,
                            disable:
                                controller.formIsValid.value ? false : true,
                            onPressed: controller.resetOptionIsEmail == true
                                ? controller.submitOTPViaEmail
                                : controller.submitOTPViaPhone,
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
          kSizedBox,
          resetTxPinOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "Enter Verification Code",
            subtitle: controller.resetOptionIsEmail == true
                ? "We’ve sent a verification code to your email address. Please enter code below to continue."
                : "We’ve sent a verification code to your mobile number. Please enter code below to continue.",
          ),
          kBigSizedBox,
          resetTxPinOTPFormMobile(
            controller,
            media,
            context,
          ),
          kSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: controller.timerComplete.isTrue
                      ? controller.resetOptionIsEmail
                          ? controller.requestOTPViaEmail
                          : controller.requestOTPViaPhone
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
          GetBuilder<ResetTxPinOTPController>(
            builder: (controller) {
              return AndroidElevatedButton(
                title: "Verify",
                isLoading: controller.isLoading.value ? true : false,
                disable: controller.formIsValid.value ? false : true,
                onPressed: controller.resetOptionIsEmail == true
                    ? controller.submitOTPViaEmail
                    : controller.submitOTPViaPhone,
              );
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
