import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/kyc/kyc_bvn_controller.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';
import '../../../../auth/components/auth_cupertino_nav_bar.dart';
import '../../content/kyc_bvn_page_header.dart';

class KycBvnCupertinoScaffold extends GetView<KycBvnController> {
  const KycBvnCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycBvnController = KycBvnController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "BVN",
        faIcon: Icon(
          CupertinoIcons.building_2_fill,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycBvnPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "BVN Verification",
              subtitle:
                  "We need to verify your account for in-app transactions",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: kycBvnController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 100,
                              child: MyCupertinoTextField(
                                readOnly: kycBvnController.isLoading.isFalse
                                    ? false
                                    : true,
                                controller: kycBvnController.bvnEC,
                                focusNode: kycBvnController.bvnFN,
                                placeholder: "Enter your BVN",
                                obscureText:
                                    !kycBvnController.bvnIsHidden.value,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                borderColor: kTransparentColor,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 11,
                                onChanged: kycBvnController.bvnOnChanged,
                                onSubmitted: kycBvnController.onSubmitted,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      kycBvnController.bvnIsHidden.value =
                                          !kycBvnController.bvnIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: kycBvnController.bvnIsHidden.value
                                        ? "Show BVN"
                                        : "Hide BVN",
                                    icon: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      kycBvnController.bvnIsHidden.value
                                          ? CupertinoIcons.eye_slash_fill
                                          : CupertinoIcons.eye_fill,
                                    ),
                                  ),
                                  kycBvnController.isBvnValid.value
                                      ? Icon(
                                          Icons.check_circle,
                                          color: kSuccessColor,
                                        )
                                      : Icon(
                                          Icons.check_circle,
                                          color: kErrorColor,
                                        ),
                                ],
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
            kSizedBox,
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<KycBvnController>(
              builder: (controller) {
                return CupertinoElevatedButton(
                  title: "Continue",
                  isLoading: kycBvnController.isLoading.value,
                  disable: kycBvnController.formIsValid.value ? false : true,
                  onPressed: kycBvnController.submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
