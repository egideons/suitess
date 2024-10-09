import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/android/kyc/kyc_add_location/content/android_kyc_add_location_page_header.dart';
import 'package:suitess/src/controllers/kyc/kyc_choose_location_controller.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';
import 'android_show_kyc_choose_country_modal_popup.dart';
import 'android_show_kyc_choose_state_modal_popup.dart';

class AndroidKycAddLocationScaffold extends GetView<KycAddLocationController> {
  const AndroidKycAddLocationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    //Mobile Landscape mode or Large screens
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(toolbarHeight: 4),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: media.width / 2.2,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          Assets.locationSvg,
                          fit: BoxFit.fitHeight,
                          height: deviceType(media.width) > 2
                              ? media.height * .4
                              : media.height * .2,
                        ),
                        kSizedBox,
                        androidKycAddLocationPageHeader(
                          colorScheme: colorScheme,
                          media: media,
                        ),
                        const SizedBox(height: kDefaultPadding * 2),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: colorScheme.inversePrimary,
                      ),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () {
                            return Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: controller.isLoading.value
                                        ? null
                                        : () {
                                            androidShowKYCChooseCountryModalPopup(
                                              context,
                                              colorScheme,
                                              media,
                                              controller,
                                            );
                                          },
                                    borderRadius: BorderRadius.circular(16),
                                    child: formFieldContainer(
                                      colorScheme,
                                      media,
                                      containerHeight: media.height * .1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Obx(
                                              () => Text(
                                                controller
                                                    .selectedCountry.value,
                                                style: defaultTextStyle(
                                                  fontSize: 14,
                                                  color: colorScheme.primary,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Iconsax.arrow_down_1,
                                              color: colorScheme.primary,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  kSizedBox,
                                  InkWell(
                                    onTap:
                                        controller.statePickerIsEnabled.isFalse
                                            ? null
                                            : controller.isLoading.value
                                                ? null
                                                : () {
                                                    androidShowKYCChooseStateModalPopup(
                                                      context,
                                                      colorScheme,
                                                      media,
                                                      controller,
                                                    );
                                                  },
                                    borderRadius: BorderRadius.circular(16),
                                    child: formFieldContainer(
                                      colorScheme,
                                      media,
                                      containerHeight: media.height * .1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.statePickerIsEnabled
                                                      .isFalse
                                                  ? "Choose State"
                                                  : controller
                                                      .selectedState.value,
                                              style: defaultTextStyle(
                                                fontSize: 14,
                                                color: controller
                                                        .statePickerIsEnabled
                                                        .isFalse
                                                    ? colorScheme.inversePrimary
                                                    : colorScheme.primary,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Icon(
                                              Iconsax.arrow_down_1,
                                              color: controller
                                                      .statePickerIsEnabled
                                                      .isFalse
                                                  ? colorScheme.inversePrimary
                                                  : colorScheme.primary,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  kSizedBox,
                                  formFieldContainer(
                                    colorScheme,
                                    media,
                                    containerHeight: media.height * .1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AndroidTextFormField(
                                        readOnly: controller
                                                    .cityTextFieldIsEnabled
                                                    .value &&
                                                controller.isLoading.isFalse
                                            ? false
                                            : true,
                                        controller: controller.cityEC,
                                        focusNode: controller.cityFN,
                                        hintText: "City",
                                        textInputAction: TextInputAction.next,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        keyboardType: TextInputType.text,
                                        onChanged: controller.cityOnChanged,
                                        validator: (value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  kSizedBox,
                                  formFieldContainer(
                                    colorScheme,
                                    media,
                                    containerHeight: media.height * .1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AndroidTextFormField(
                                        readOnly: controller
                                                    .addressTextFieldIsEnabled
                                                    .value &&
                                                controller.isLoading.isFalse
                                            ? false
                                            : true,
                                        controller: controller.addressEC,
                                        focusNode: controller.addressFN,
                                        hintText: "Address",
                                        textInputAction: TextInputAction.done,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        keyboardType: TextInputType.text,
                                        onChanged: controller.addressOnChanged,
                                        onFieldSubmitted:
                                            controller.onSubmitted,
                                        validator: (value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: kDefaultPadding * 2),
                        GetBuilder<KycAddLocationController>(
                          init: KycAddLocationController(),
                          builder: (controller) {
                            return AndroidElevatedButton(
                              title: "Continue",
                              disable:
                                  controller.formIsValid.value ? false : true,
                              isLoading: controller.isLoading.value,
                              onPressed: controller.submitForm,
                            );
                          },
                        ),
                        GetBuilder<KycAddLocationController>(
                          init: KycAddLocationController(),
                          builder: (controller) {
                            return AndroidElevatedButton(
                              title: "Skip",
                              textColor: kSuccessColor,
                              buttonColor: colorScheme.surface,
                              disabledBackgroundColor: colorScheme.surface,
                              disable: controller.isLoading.value,
                              onPressed: controller.skipPage,
                            );
                          },
                        ),
                        kSizedBox,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //Portrait mode for Mobile Screens
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(toolbarHeight: 4),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SvgPicture.asset(
              Assets.locationSvg,
              fit: BoxFit.fitHeight,
              height: media.height * .24,
            ),
            kSizedBox,
            androidKycAddLocationPageHeader(
                colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: controller.isLoading.value
                            ? null
                            : () {
                                androidShowKYCChooseCountryModalPopup(
                                  context,
                                  colorScheme,
                                  media,
                                  controller,
                                );
                              },
                        borderRadius: BorderRadius.circular(16),
                        child: formFieldContainer(
                          colorScheme,
                          media,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.selectedCountry.value,
                                    style: defaultTextStyle(
                                      fontSize: 14,
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_down_1,
                                  color: colorScheme.primary,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      InkWell(
                        onTap: controller.statePickerIsEnabled.isFalse
                            ? null
                            : controller.isLoading.value
                                ? null
                                : () {
                                    androidShowKYCChooseStateModalPopup(
                                      context,
                                      colorScheme,
                                      media,
                                      controller,
                                    );
                                  },
                        borderRadius: BorderRadius.circular(16),
                        child: formFieldContainer(
                          colorScheme,
                          media,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.statePickerIsEnabled.isFalse
                                      ? "Choose State"
                                      : controller.selectedState.value,
                                  style: defaultTextStyle(
                                    fontSize: 14,
                                    color:
                                        controller.statePickerIsEnabled.isFalse
                                            ? colorScheme.inversePrimary
                                            : colorScheme.primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_down_1,
                                  color: controller.statePickerIsEnabled.isFalse
                                      ? colorScheme.inversePrimary
                                      : colorScheme.primary,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: AndroidTextFormField(
                          readOnly: controller.cityTextFieldIsEnabled.value &&
                                  controller.isLoading.isFalse
                              ? false
                              : true,
                          controller: controller.cityEC,
                          focusNode: controller.cityFN,
                          hintText: "City",
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          onChanged: controller.cityOnChanged,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: AndroidTextFormField(
                          readOnly:
                              controller.addressTextFieldIsEnabled.value &&
                                      controller.isLoading.isFalse
                                  ? false
                                  : true,
                          controller: controller.addressEC,
                          focusNode: controller.addressFN,
                          hintText: "Address",
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          onChanged: controller.addressOnChanged,
                          onFieldSubmitted: controller.onSubmitted,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<KycAddLocationController>(
              init: KycAddLocationController(),
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Continue",
                  disable: controller.formIsValid.value ? false : true,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.submitForm,
                );
              },
            ),
            GetBuilder<KycAddLocationController>(
              init: KycAddLocationController(),
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Skip",
                  textColor: kSuccessColor,
                  buttonColor: colorScheme.surface,
                  disabledBackgroundColor: colorScheme.surface,
                  disable: controller.isLoading.value,
                  onPressed: controller.skipPage,
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
