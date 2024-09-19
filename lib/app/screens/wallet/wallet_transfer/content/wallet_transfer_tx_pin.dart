import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../../theme/colors.dart';

class WalletTransferTxPin extends GetView<WalletTransferController> {
  const WalletTransferTxPin({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<WalletTransferController>(
            init: WalletTransferController(),
            builder: (controller) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Get.close(0);
                        },
                        icon: Icon(
                          Icons.close,
                          color: colorScheme.inversePrimary,
                          size: 18,
                        ),
                      ),
                    ),
                    kHalfSizedBox,
                    Text(
                      "Enter Transaction Pin",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: kTextBoldHeadingColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kSizedBox,
                    Form(
                      key: controller.txPinFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formFieldContainer(
                            colorScheme,
                            media,
                            containerWidth: 60,
                            containerHeight: 60,
                            child: AndroidTextFormField(
                              controller: controller.txPin1EC,
                              focusNode: controller.txPin1FN,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.txPin1Onchanged(value, context);
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
                          formFieldContainer(
                            colorScheme,
                            media,
                            containerWidth: 60,
                            containerHeight: 60,
                            child: AndroidTextFormField(
                              controller: controller.txPin2EC,
                              focusNode: controller.txPin2FN,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                controller.txPin2Onchanged(value, context);
                              },
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          formFieldContainer(
                            colorScheme,
                            media,
                            containerWidth: 60,
                            containerHeight: 60,
                            child: AndroidTextFormField(
                              controller: controller.txPin3EC,
                              focusNode: controller.txPin3FN,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                controller.txPin3Onchanged(value, context);
                              },
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          formFieldContainer(
                            colorScheme,
                            media,
                            containerWidth: 60,
                            containerHeight: 60,
                            child: AndroidTextFormField(
                              controller: controller.txPin4EC,
                              focusNode: controller.txPin4FN,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: controller.onTxPinSubmitted,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                controller.txPin4Onchanged(value, context);
                              },
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    kSizedBox,
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Pin?",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: colorScheme.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    kSizedBox,
                    AndroidElevatedButton(
                      title: "Confirm",
                      onPressed: controller.submitTxPin,
                    ),
                    kBigSizedBox,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
