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

    final otpController = OTPController.instance;

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
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
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
                        if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
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
                        if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
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
                        if (value.isEmpty) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (value.length == 1) {
                          otpController.formIsValid.value = true;
                        }
                      },
                      onSubmitted: (value) {
                        otpController.sendOTP;
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
            builder: (context) {
              return CupertinoElevatedButton(
                title: "Continue",
                disable: otpController.formIsValid.isTrue ? false : true,
                isLoading: otpController.isLoading.value,
                onPressed: otpController.sendOTP,
              );
            },
          ),
          kSizedBox,
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
          kSizedBox,
          CupertinoButton(
            onPressed: () {},
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
                        color: kSuccessColor,
                        size: 12,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        "Resend code",
                        style: defaultTextStyle(color: kSuccessColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
