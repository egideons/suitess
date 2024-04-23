import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/bvn_controller.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';
import '../../../../auth/components/auth_cupertino_nav_bar.dart';
import '../../content/bvn_page_header.dart';

class BvnCupertinoScaffold extends GetView<BvnController> {
  const BvnCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var bvnController = BvnController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "BVN",
        faIcon: FaIcon(
          FontAwesomeIcons.buildingColumns,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            bvnPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "BVN Verification",
              subtitle:
                  "We need to verify your account for a in-app payments and other benefits",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: bvnController.formKey,
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
                                readOnly: bvnController.isLoading.isFalse
                                    ? false
                                    : true,
                                controller: bvnController.bvnEC,
                                focusNode: bvnController.bvnFN,
                                placeholder: "Enter your BVN",
                                obscureText: !bvnController.bvnIsHidden.value,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                borderColor: kTransparentColor,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 11,
                                onChanged: bvnController.bvnOnChanged,
                                onSubmitted: bvnController.onSubmitted,
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
                                      bvnController.bvnIsHidden.value =
                                          !bvnController.bvnIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: bvnController.bvnIsHidden.value
                                        ? "Show BVN"
                                        : "Hide BVN",
                                    icon: FaIcon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      bvnController.bvnIsHidden.value
                                          ? FontAwesomeIcons.solidEyeSlash
                                          : FontAwesomeIcons.solidEye,
                                    ),
                                  ),
                                  bvnController.isBvnValid.value
                                      ? FaIcon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          color: kSuccessColor,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.solidCircleXmark,
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
            GetBuilder<BvnController>(
              builder: (controller) {
                return CupertinoElevatedButton(
                  title: "Continue",
                  isLoading: bvnController.isLoading.value,
                  disable: bvnController.formIsValid.value ? false : true,
                  onPressed: bvnController.submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
