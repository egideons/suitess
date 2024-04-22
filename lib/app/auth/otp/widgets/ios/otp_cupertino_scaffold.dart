import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/otp/content/otp_page_header.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/otp_controller.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/text_form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';
import '../../../components/auth_cupertino_nav_bar.dart';

class OTPCupertinoScaffold extends GetView<OTPController> {
  const OTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var otpController = OTPController.instance;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFormFieldContainer(
                  colorScheme,
                  media,
                  containerWidth: media.width * 0.18,
                  child: Center(
                    child: MyCupertinoTextField(
                      controller: otpController.pin1EC,
                      focusNode: otpController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: kTransparentColor,
                      placeholder: "0",
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
                ),
                textFormFieldContainer(
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
                textFormFieldContainer(
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
                textFormFieldContainer(
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        otpController.pin4Onchanged(value, context);
                      },
                      onSubmitted: (value) {
                        otpController.onSubmitted(value);
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
          GetBuilder<OTPController>(
            init: OTPController(),
            builder: (controller) {
              return CupertinoElevatedButton(
                title: "Continue",
                isLoading: otpController.isLoading.value,
                disable: otpController.formIsValid.isTrue ? false : true,
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
                  return Text(
                    otpController
                        .formatTime(otpController.secondsRemaining.value),
                    textAlign: TextAlign.center,
                    style: defaultTextStyle(
                      fontSize: 15.0,
                      color: otpController.timerComplete.isTrue
                          ? kSuccessColor
                          : kErrorColor,
                      fontWeight: FontWeight.w600,
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
    );
  }
}
