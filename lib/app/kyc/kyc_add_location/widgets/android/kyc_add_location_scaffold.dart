import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc/kyc_choose_location_controller.dart';
import 'package:kribb/src/utils/buttons/android/android_elevated_button.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';
import 'package:kribb/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';
import '../../content/kyc_add_location_page_header.dart';
import 'show_kyc_choose_country_modal_popup.dart';
import 'show_kyc_choose_state_modal_popup.dart';

class KycAddLocationScaffold extends GetView<KycAddLocationController> {
  const KycAddLocationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final kycAddLocationController = KycAddLocationController.instance;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycAddLocationPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: kycAddLocationController.formKey,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: kycAddLocationController.isLoading.value
                            ? null
                            : () {
                                showKYCChooseCountryModalPopup(
                                  context,
                                  colorScheme,
                                  media,
                                  kycAddLocationController,
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
                                  () {
                                    return Text(
                                      kycAddLocationController
                                          .selectedCountry.value,
                                      style: defaultTextStyle(
                                        fontSize: 14.0,
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    );
                                  },
                                ),
                                FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: colorScheme.primary,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      InkWell(
                        onTap: kycAddLocationController
                                .statePickerIsEnabled.isFalse
                            ? null
                            : kycAddLocationController.isLoading.value
                                ? null
                                : () {
                                    showKYCChooseStateModalPopup(
                                      context,
                                      colorScheme,
                                      media,
                                      kycAddLocationController,
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
                                  kycAddLocationController
                                          .statePickerIsEnabled.isFalse
                                      ? "Choose State"
                                      : kycAddLocationController
                                          .selectedState.value,
                                  style: defaultTextStyle(
                                    fontSize: 14.0,
                                    color: kycAddLocationController
                                            .statePickerIsEnabled.isFalse
                                        ? colorScheme.inversePrimary
                                        : colorScheme.primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: kycAddLocationController
                                          .statePickerIsEnabled.isFalse
                                      ? colorScheme.inversePrimary
                                      : colorScheme.primary,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 80,
                              child: AndroidTextFormField(
                                readOnly: kycAddLocationController
                                            .cityTextFieldIsEnabled.value &&
                                        kycAddLocationController
                                            .isLoading.isFalse
                                    ? false
                                    : true,
                                controller: kycAddLocationController.cityEC,
                                focusNode: kycAddLocationController.cityFN,
                                hintText: "City",
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
                                onChanged:
                                    kycAddLocationController.cityOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: kycAddLocationController.isCityValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          formFieldContainer(
                            colorScheme,
                            media,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            containerWidth: media.width - 62,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: media.width - 140,
                                  child: AndroidTextFormField(
                                    readOnly: kycAddLocationController
                                                .addressTextFieldIsEnabled
                                                .value &&
                                            kycAddLocationController
                                                .isLoading.isFalse
                                        ? false
                                        : true,
                                    controller:
                                        kycAddLocationController.addressEC,
                                    focusNode:
                                        kycAddLocationController.addressFN,
                                    hintText: "Address",
                                    textInputAction: TextInputAction.done,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    keyboardType: TextInputType.text,
                                    onChanged: kycAddLocationController
                                        .addressOnChanged,
                                    onFieldSubmitted:
                                        kycAddLocationController.onSubmitted,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: kycAddLocationController
                                          .isAddressValid.value
                                      ? FaIcon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          color: kSuccessColor,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.solidCircleXmark,
                                          color: kErrorColor,
                                        ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: kycAddLocationController
                                        .addressTextFieldIsEnabled.value &&
                                    kycAddLocationController.isLoading.isFalse
                                ? () {}
                                : null,
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(Assets.googleMaps),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Address must start with the street number",
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
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
                      kycAddLocationController.formIsValid.value ? false : true,
                  isLoading: kycAddLocationController.isLoading.value,
                  onPressed: kycAddLocationController.submitForm,
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
