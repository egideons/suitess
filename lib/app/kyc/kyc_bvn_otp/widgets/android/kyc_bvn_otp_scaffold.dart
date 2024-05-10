import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/components/auth_app_bar.dart';
import 'package:kribb/app/kyc/kyc_bvn_otp/content/kyc_bvn_otp_page_header.dart';
import 'package:kribb/src/controllers/kyc/kyc_bvn_otp_controller.dart';
import 'package:kribb/src/utils/buttons/android/android_elevated_button.dart';
import 'package:kribb/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../theme/colors.dart';

class KycBvnOTPScaffold extends GetView<KycBvnOTPController> {
  const KycBvnOTPScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycBvnOTPController = KycBvnOTPController.instance;

    return Scaffold(
      appBar: authAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "BVN",
        faIcon: FaIcon(
          FontAwesomeIcons.buildingColumns,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          kycBvnOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "BVN Verification",
            subtitle: "Enter the 4-digit OTP sent to your phone number",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: kycBvnOTPController.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formFieldContainer(
                  colorScheme,
                  media,
                  containerWidth: media.width * 0.18,
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: AndroidTextFormField(
                      controller: kycBvnOTPController.pin1EC,
                      focusNode: kycBvnOTPController.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      onChanged: (value) {
                        kycBvnOTPController.pin1Onchanged(value, context);
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: AndroidTextFormField(
                      controller: kycBvnOTPController.pin2EC,
                      focusNode: kycBvnOTPController.pin2FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        kycBvnOTPController.pin2Onchanged(value, context);
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: AndroidTextFormField(
                      controller: kycBvnOTPController.pin3EC,
                      focusNode: kycBvnOTPController.pin3FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        kycBvnOTPController.pin3Onchanged(value, context);
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: AndroidTextFormField(
                      controller: kycBvnOTPController.pin4EC,
                      focusNode: kycBvnOTPController.pin4FN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      onFieldSubmitted: kycBvnOTPController.onSubmitted,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        kycBvnOTPController.pin4Onchanged(value, context);
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
          GetBuilder<KycBvnOTPController>(
            builder: (controller) {
              return AndroidElevatedButton(
                title: "Continue",
                isLoading: kycBvnOTPController.isLoading.value ? true : false,
                disable: kycBvnOTPController.formIsValid.value ? false : true,
                onPressed: kycBvnOTPController.submitOTP,
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
                      color: kycBvnOTPController.timerComplete.isTrue
                          ? kSuccessColor
                          : kErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    child: Text(
                      kycBvnOTPController.formatTime(
                          kycBvnOTPController.secondsRemaining.value),
                    ),
                  );
                },
              ),
            ],
          ),
          kSizedBox,
          Obx(
            () {
              return Center(
                child: InkWell(
                  onTap: kycBvnOTPController.timerComplete.isTrue
                      ? kycBvnOTPController.requestOTP
                      : null,
                  borderRadius: BorderRadius.circular(24),
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
                            FontAwesomeIcons.solidMessage,
                            color: kycBvnOTPController.timerComplete.isTrue
                                ? kSuccessColor
                                : colorScheme.inversePrimary,
                            size: 12,
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            "Resend code",
                            style: defaultTextStyle(
                              color: kycBvnOTPController.timerComplete.isTrue
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
