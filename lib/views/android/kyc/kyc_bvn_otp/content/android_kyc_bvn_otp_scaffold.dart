import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/kyc/kyc_bvn_otp_controller.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/text_form_fields/android/android_textformfield.dart';
import 'package:suitess/views/android/auth/components/auth_app_bar.dart';
import 'package:suitess/views/android/kyc/kyc_bvn_otp/content/android_kyc_bvn_otp_page_header.dart';

import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/containers/form_field_container.dart';

class AndroidKycBvnOTPScaffold extends GetView<KycBvnOTPController> {
  const AndroidKycBvnOTPScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidAuthAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "BVN",
        icon: Icon(
          Icons.business,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          androidKycBvnOTPPageHeader(
            colorScheme: colorScheme,
            media: media,
            title: "BVN Verification",
            subtitle: "Enter the 6-digit OTP sent to your phone number",
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Form(
            key: controller.formKey,
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
                      controller: controller.pin1EC,
                      focusNode: controller.pin1FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      onChanged: (value) {
                        controller.pin1Onchanged(value, context);
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
                      controller: controller.pin2EC,
                      focusNode: controller.pin2FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        controller.pin2Onchanged(value, context);
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
                      controller: controller.pin3EC,
                      focusNode: controller.pin3FN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        controller.pin3Onchanged(value, context);
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
                      controller: controller.pin4EC,
                      focusNode: controller.pin4FN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      hintText: "0",
                      onFieldSubmitted: controller.onSubmitted,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        controller.pin4Onchanged(value, context);
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
                isLoading: controller.isLoading.value ? true : false,
                disable: controller.formIsValid.value ? false : true,
                onPressed: controller.submitOTP,
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
                      color: controller.timerComplete.isTrue
                          ? kSuccessColor
                          : kErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    child: Text(
                      controller.formatTime(controller.secondsRemaining.value),
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
                  onTap: controller.timerComplete.isTrue
                      ? controller.requestOTP
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
                          Icon(
                            Icons.email_rounded,
                            color: kSuccessColor,
                            size: 12,
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            "Resend code",
                            style: defaultTextStyle(
                              color: kSuccessColor,
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
