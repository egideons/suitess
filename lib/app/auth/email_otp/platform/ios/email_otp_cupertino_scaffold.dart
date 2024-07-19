import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/phone_otp/content/phone_otp_page_header.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/email_otp_controller.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';

class EmailOTPCupertinoScaffold extends GetView<EmailOTPController> {
  const EmailOTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var otpController = EmailOTPController.instance;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kSizedBox,
            SvgPicture.asset(
              Assets.otpSvg,
              fit: BoxFit.fitHeight,
              height: media.height * .2,
            ),
            kSizedBox,
            phoneOTPPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "OTP verification",
              subtitle: "Enter the 4-digit verification code we sent to ",
              phoneNumber: "*******6497",
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
                    width: media.width * .18,
                    child: MyCupertinoTextField(
                      controller: otpController.pin1EC,
                      focusNode: otpController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: colorScheme.primary,
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
                  formFieldContainer(
                    colorScheme,
                    media,
                    containerWidth: media.width * 0.18,
                    child: Center(
                      child: MyCupertinoTextField(
                        controller: otpController.pin2EC,
                        focusNode: otpController.pin2FN,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        borderColor: kTransparentColor,
                        placeholder: "0",
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
                  ),
                  formFieldContainer(
                    colorScheme,
                    media,
                    containerWidth: media.width * 0.18,
                    child: Center(
                      child: MyCupertinoTextField(
                        controller: otpController.pin3EC,
                        focusNode: otpController.pin3FN,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        borderColor: kTransparentColor,
                        placeholder: "0",
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
                  ),
                  formFieldContainer(
                    colorScheme,
                    media,
                    containerWidth: media.width * 0.18,
                    child: Center(
                      child: MyCupertinoTextField(
                        controller: otpController.pin4EC,
                        focusNode: otpController.pin4FN,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        borderColor: kTransparentColor,
                        placeholder: "0",
                        onSubmitted: otpController.onSubmitted,
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
                  ),
                ],
              ),
            ),
            kSizedBox,
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<EmailOTPController>(
              builder: (controller) {
                return CupertinoElevatedButton(
                  title: "Continue",
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
                kHalfWidthSizedBox,
                Obx(
                  () {
                    return AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      style: defaultTextStyle(
                        fontSize: 15.0,
                        color: otpController.timerComplete.isTrue
                            ? kSuccessColor
                            : kErrorColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      child: Text(
                        otpController
                            .formatTime(otpController.secondsRemaining.value),
                      ),
                    );
                  },
                ),
              ],
            ),
            kSizedBox,
            Obx(
              () {
                return CupertinoButton(
                  onPressed: otpController.timerComplete.isTrue
                      ? otpController.requestOTP
                      : null,
                  disabledColor: colorScheme.inversePrimary,
                  child: Center(
                    child: Container(
                      width: media.width - 180,
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
                            Icon(
                              CupertinoIcons.envelope_fill,
                              color: otpController.timerComplete.isTrue
                                  ? kSuccessColor
                                  : colorScheme.inversePrimary,
                              size: 12,
                            ),
                            kHalfWidthSizedBox,
                            Text(
                              "Resend code",
                              style: defaultTextStyle(
                                color: otpController.timerComplete.isTrue
                                    ? kSuccessColor
                                    : colorScheme.inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            kSizedBox,
          ],
        ),
      ),
    );
  }
}
