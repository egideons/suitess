import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';

import '../../../../../src/constants/consts.dart';
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
            Form(
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  Obx(
                    () {
                      return GestureDetector(
                        onTap: kycAddLocationController.selectedCountry.value ==
                                "Choose Country"
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
                                              .selectedCountry.value ==
                                          "Choose Country"
                                      ? "Choose State"
                                      : kycAddLocationController
                                          .selectedState.value,
                                  style: defaultTextStyle(
                                    fontSize: 14.0,
                                    color: kycAddLocationController
                                                .selectedCountry.value ==
                                            "Choose Country"
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
