import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';

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
                        onTap: () {
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
                                  color: colorScheme.primary,
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
                                // prefix: Padding(
                                //   padding: const EdgeInsets.only(left: 10.0),
                                //   child: Text(
                                //     kycAddLocationController.ngnDialCode.value,
                                //     style: defaultTextStyle(),
                                //   ),
                                // ),
                                enabled: kycAddLocationController
                                    .cityTextFieldIsEnabled.value,
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
                                // prefix: Padding(
                                //   padding: const EdgeInsets.only(left: 10.0),
                                //   child: Text(
                                //     kycAddLocationController.ngnDialCode.value,
                                //     style: defaultTextStyle(),
                                //   ),
                                // ),
                                enabled: kycAddLocationController
                                    .cityTextFieldIsEnabled.value,
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
                  disable: kycAddLocationController.formIsValid.isTrue
                      ? false
                      : true,
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
