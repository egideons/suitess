import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/forgot_password_via_sms.dart';
import '../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../../theme/colors.dart';
import '../../../../components/auth_cupertino_nav_bar.dart';
import '../../content/forgot_password_via_sms.dart';

class ForgotPasswordViaSMSOTPCupertinoScaffold
    extends GetView<ForgotPasswordViaSMSOtpController> {
  const ForgotPasswordViaSMSOTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var forgotPasswordViaSMSController =
        ForgotPasswordViaSMSOtpController.instance;

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
          forgotPasswordViaSMSOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "Verify OTP",
            subtitle: "Enter the 4-digit OTP sent to your phone number",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: forgotPasswordViaSMSController.formKey,
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
                      controller: forgotPasswordViaSMSController.pin1EC,
                      focusNode: forgotPasswordViaSMSController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: kTransparentColor,
                      placeholder: "0",
                      onChanged: (value) {
                        forgotPasswordViaSMSController.pin1Onchanged(
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
                      controller: forgotPasswordViaSMSController.pin2EC,
                      focusNode: forgotPasswordViaSMSController.pin2FN,
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
                        forgotPasswordViaSMSController.pin2Onchanged(
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
                      controller: forgotPasswordViaSMSController.pin3EC,
                      focusNode: forgotPasswordViaSMSController.pin3FN,
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
                        forgotPasswordViaSMSController.pin3Onchanged(
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
                      controller: forgotPasswordViaSMSController.pin4EC,
                      focusNode: forgotPasswordViaSMSController.pin4FN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      borderColor: kTransparentColor,
                      placeholder: "0",
                      onSubmitted: forgotPasswordViaSMSController.onSubmitted,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        forgotPasswordViaSMSController.pin4Onchanged(
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
          GetBuilder<ForgotPasswordViaSMSOtpController>(
            builder: (controller) {
              return CupertinoElevatedButton(
                title: "Continue",
                isLoading: forgotPasswordViaSMSController.isLoading.value
                    ? true
                    : false,
                disable: forgotPasswordViaSMSController.formIsValid.value
                    ? false
                    : true,
                onPressed: forgotPasswordViaSMSController.submitOTP,
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
                      color: forgotPasswordViaSMSController.timerComplete.isTrue
                          ? kSuccessColor
                          : kErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    child: Text(
                      forgotPasswordViaSMSController.formatTime(
                          forgotPasswordViaSMSController
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
                onPressed: forgotPasswordViaSMSController.timerComplete.isTrue
                    ? forgotPasswordViaSMSController.requestOTP
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
                          FaIcon(
                            FontAwesomeIcons.solidEnvelope,
                            color: forgotPasswordViaSMSController
                                    .timerComplete.isTrue
                                ? kSuccessColor
                                : colorScheme.inversePrimary,
                            size: 12,
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            "Resend code",
                            style: defaultTextStyle(
                              color: forgotPasswordViaSMSController
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
