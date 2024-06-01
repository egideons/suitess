import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/email_otp_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/email_otp_page_header.dart';

class EmailOTPScaffold extends GetView<EmailOTPController> {
  const EmailOTPScaffold({super.key, required this.userEmail});

  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var otpController = EmailOTPController.instance;

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
                  emailOTPPageHeader(
                    colorScheme: colorScheme,
                    media: media,
                    title: "OTP verification",
                    subtitle: "Enter the 4-digit verification code we sent to ",
                    email: "$userEmail",
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
                      Form(
                        key: otpController.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller: otpController.pin1EC,
                                focusNode: otpController.pin1FN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                onChanged: (value) {
                                  otpController.pin1Onchanged(value, context);
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
                                controller: otpController.pin2EC,
                                focusNode: otpController.pin2FN,
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
                                  otpController.pin2Onchanged(value, context);
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller: otpController.pin3EC,
                                focusNode: otpController.pin3FN,
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
                                  otpController.pin3Onchanged(value, context);
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: media.width * .08,
                              child: AndroidTextFormField(
                                controller: otpController.pin4EC,
                                focusNode: otpController.pin4FN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                inputBorder: const UnderlineInputBorder(),
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                onFieldSubmitted: otpController.onSubmitted,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  otpController.pin4Onchanged(value, context);
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
                      GetBuilder<EmailOTPController>(
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
                                  color: otpController.timerComplete.isTrue
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
            emailOTPPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "OTP verification",
              subtitle: "Enter the 4-digit verification code we sent to ",
              email: "$userEmail",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Form(
              key: otpController.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: media.width * 0.18,
                    child: AndroidTextFormField(
                      controller: otpController.pin1EC,
                      focusNode: otpController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      inputBorder: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(),
                      onChanged: (value) {
                        otpController.pin1Onchanged(value, context);
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
                      controller: otpController.pin2EC,
                      focusNode: otpController.pin2FN,
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
                        otpController.pin2Onchanged(value, context);
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.18,
                    child: AndroidTextFormField(
                      controller: otpController.pin3EC,
                      focusNode: otpController.pin3FN,
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
                        otpController.pin3Onchanged(value, context);
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.18,
                    child: AndroidTextFormField(
                      controller: otpController.pin4EC,
                      focusNode: otpController.pin4FN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      inputBorder: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(),
                      onFieldSubmitted: otpController.onSubmitted,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        otpController.pin4Onchanged(value, context);
                      },
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
            GetBuilder<EmailOTPController>(
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
                        color: otpController.timerComplete.isTrue
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
            kSizedBox,
          ],
        ),
      ),
    );
  }
}
