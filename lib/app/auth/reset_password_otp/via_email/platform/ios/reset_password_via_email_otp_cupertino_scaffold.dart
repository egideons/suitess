import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/auth/reset_password_via_email_otp_controller.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../../theme/colors.dart';
import '../../../../components/auth_cupertino_nav_bar.dart';
import '../../content/reset_password_via_email_otp_page_header.dart';

class ResetPasswordViaEmailOTPCupertinoScaffold
    extends GetView<ResetPasswordViaEmailOTPController> {
  const ResetPasswordViaEmailOTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var forgotPasswordViaEmailController =
        ResetPasswordViaEmailOTPController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        previousPageTitle: "Back",
        colorScheme: colorScheme,
        media: media,
        title: "OTP",
      ),
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          resetPasswordViaEmailOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "Verify OTP",
            subtitle: "Enter the 4-digit OTP sent to your email",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: forgotPasswordViaEmailController.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formFieldContainer(
                  colorScheme,
                  media,
                  containerWidth: media.width * 0.18,
                  child: Center(
                    child: MyCupertinoTextField(
                      controller: forgotPasswordViaEmailController.pin1EC,
                      focusNode: forgotPasswordViaEmailController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: kTransparentColor,
                      placeholder: "0",
                      onChanged: (value) {
                        forgotPasswordViaEmailController.pin1Onchanged(
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
                ),
                formFieldContainer(
                  colorScheme,
                  media,
                  containerWidth: media.width * 0.18,
                  child: Center(
                    child: MyCupertinoTextField(
                      controller: forgotPasswordViaEmailController.pin2EC,
                      focusNode: forgotPasswordViaEmailController.pin2FN,
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
                        forgotPasswordViaEmailController.pin2Onchanged(
                            value, context);
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
                      controller: forgotPasswordViaEmailController.pin3EC,
                      focusNode: forgotPasswordViaEmailController.pin3FN,
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
                        forgotPasswordViaEmailController.pin3Onchanged(
                            value, context);
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
                      controller: forgotPasswordViaEmailController.pin4EC,
                      focusNode: forgotPasswordViaEmailController.pin4FN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: kTransparentColor,
                      placeholder: "0",
                      onSubmitted: forgotPasswordViaEmailController.onSubmitted,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        forgotPasswordViaEmailController.pin4Onchanged(
                            value, context);
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
          GetBuilder<ResetPasswordViaEmailOTPController>(
            builder: (controller) {
              return CupertinoElevatedButton(
                title: "Continue",
                isLoading: forgotPasswordViaEmailController.isLoading.value
                    ? true
                    : false,
                disable: forgotPasswordViaEmailController.formIsValid.value
                    ? false
                    : true,
                onPressed: forgotPasswordViaEmailController.submitOTP,
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
                      color:
                          forgotPasswordViaEmailController.timerComplete.isTrue
                              ? kSuccessColor
                              : kErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    child: Text(
                      forgotPasswordViaEmailController.formatTime(
                          forgotPasswordViaEmailController
                              .secondsRemaining.value),
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
                onPressed: forgotPasswordViaEmailController.timerComplete.isTrue
                    ? forgotPasswordViaEmailController.requestOTP
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
                            color: forgotPasswordViaEmailController
                                    .timerComplete.isTrue
                                ? kSuccessColor
                                : colorScheme.inversePrimary,
                            size: 12,
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            "Resend code",
                            style: defaultTextStyle(
                              color: forgotPasswordViaEmailController
                                      .timerComplete.isTrue
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
    );
  }
}
