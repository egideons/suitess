import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc/kyc_choose_location_controller.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';
import '../../content/kyc_add_location_page_header.dart';
import 'kyc_choose_country_cupertino_modal_popup.dart';
import 'kyc_choose_state_cupertino_modal_popup.dart';

class KycAddLocationCupertinoScaffold
    extends GetView<KycAddLocationController> {
  const KycAddLocationCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final kycAddLocationController = KycAddLocationController.instance;
    return CupertinoPageScaffold(
      child: SafeArea(
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
                      GestureDetector(
                        onTap: kycAddLocationController.isLoading.value
                            ? null
                            : () {
                                showKYCChooseCountryCupertinoPopup(
                                  context,
                                  colorScheme,
                                  media,
                                  kycAddLocationController,
                                );
                              },
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
                      GestureDetector(
                        onTap: kycAddLocationController
                                .statePickerIsEnabled.isFalse
                            ? null
                            : kycAddLocationController.isLoading.value
                                ? null
                                : () {
                                    showKYCChooseStateCupertinoPopup(
                                      context,
                                      colorScheme,
                                      media,
                                      kycAddLocationController,
                                    );
                                  },
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 60,
                              child: MyCupertinoTextField(
                                readOnly: kycAddLocationController
                                            .cityTextFieldIsEnabled.value &&
                                        kycAddLocationController
                                            .isLoading.isFalse
                                    ? false
                                    : true,
                                controller: kycAddLocationController.cityEC,
                                focusNode: kycAddLocationController.cityFN,
                                placeholder: "City",
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.text,
                                borderColor: kTransparentColor,
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
                            containerWidth: media.width - 82,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: media.width - 120,
                                  child: MyCupertinoTextField(
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
                                    placeholder: "Address",
                                    textInputAction: TextInputAction.done,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    keyboardType: TextInputType.text,
                                    // borderColor: colorScheme.primary,
                                    borderColor: kTransparentColor,
                                    onChanged: kycAddLocationController
                                        .addressOnChanged,
                                    onSubmitted:
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
                          CupertinoButton(
                            onPressed: kycAddLocationController
                                        .addressTextFieldIsEnabled.value &&
                                    kycAddLocationController.isLoading.isFalse
                                ? () {}
                                : null,
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
                return CupertinoElevatedButton(
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
