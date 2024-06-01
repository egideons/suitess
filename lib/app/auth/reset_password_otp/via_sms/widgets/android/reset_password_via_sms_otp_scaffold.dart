import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../../../../../../src/utils/components/responsive_constants.dart';
import '../../../../../../theme/colors.dart';
import '../../content/reset_password_via_sms_page_header.dart';

class ResetPasswordViaSMSOTPScaffold
    extends GetView<ResetPasswordViaSmsOTPController> {
  const ResetPasswordViaSMSOTPScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var resetPasswordViaSmsController =
        ResetPasswordViaSmsOTPController.instance;

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
                  resetPasswordViaSMSOTPPageHeader(
                    colorScheme: colorScheme,
                    media: media,
                    title: "OTP Verification",
                    subtitle: "Enter the 4-digit OTP sent to your phone.",
                    phoneNumber: maskPhoneNumber("08074656497"),
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
                      Form(
                        key: resetPasswordViaSmsController.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller:
                                    resetPasswordViaSmsController.pin1EC,
                                focusNode: resetPasswordViaSmsController.pin1FN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                onChanged: (value) {
                                  resetPasswordViaSmsController.pin1Onchanged(
                                      value, context);
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller:
                                    resetPasswordViaSmsController.pin2EC,
                                focusNode: resetPasswordViaSmsController.pin2FN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  resetPasswordViaSmsController.pin2Onchanged(
                                      value, context);
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller:
                                    resetPasswordViaSmsController.pin3EC,
                                focusNode: resetPasswordViaSmsController.pin3FN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  resetPasswordViaSmsController.pin3Onchanged(
                                      value, context);
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller:
                                    resetPasswordViaSmsController.pin4EC,
                                focusNode: resetPasswordViaSmsController.pin4FN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                onFieldSubmitted:
                                    resetPasswordViaSmsController.onSubmitted,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  resetPasswordViaSmsController.pin4Onchanged(
                                      value, context);
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
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
                                  color: resetPasswordViaSmsController
                                          .timerComplete.isTrue
                                      ? kSuccessColor
                                      : kErrorColor,
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
                      kSizedBox,
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
            subtitle: "Enter the 4-digit OTP sent to your phone.",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: resetPasswordViaSmsController.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: media.width * 0.18,
                  child: AndroidTextFormField(
                    controller: resetPasswordViaSmsController.pin1EC,
                    focusNode: resetPasswordViaSmsController.pin1FN,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    inputBorder: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                    onChanged: (value) {
                      resetPasswordViaSmsController.pin1Onchanged(
                          value, context);
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: media.width * 0.18,
                  child: AndroidTextFormField(
                    controller: resetPasswordViaSmsController.pin2EC,
                    focusNode: resetPasswordViaSmsController.pin2FN,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    inputBorder: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                    onChanged: (value) {
                      resetPasswordViaSmsController.pin2Onchanged(
                          value, context);
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: media.width * 0.18,
                  child: AndroidTextFormField(
                    controller: resetPasswordViaSmsController.pin3EC,
                    focusNode: resetPasswordViaSmsController.pin3FN,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    inputBorder: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                    onChanged: (value) {
                      resetPasswordViaSmsController.pin3Onchanged(
                          value, context);
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: media.width * 0.18,
                  child: AndroidTextFormField(
                    controller: resetPasswordViaSmsController.pin4EC,
                    focusNode: resetPasswordViaSmsController.pin4FN,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    inputBorder: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                    onFieldSubmitted: resetPasswordViaSmsController.onSubmitted,
                    onChanged: (value) {
                      resetPasswordViaSmsController.pin4Onchanged(
                          value, context);
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          kSizedBox,
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
                      color: resetPasswordViaSmsController.timerComplete.isTrue
                          ? kSuccessColor
                          : kErrorColor,
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
          kSizedBox,
        ],
      ),
    );
  }
}
