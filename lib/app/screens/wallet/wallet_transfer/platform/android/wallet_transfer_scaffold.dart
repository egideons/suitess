import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../../src/utils/components/my_app_bar.dart';
import '../../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../../../theme/colors.dart';
import '../../content/wallet_transfer_source_wallet.dart';

class WalletTransferScaffold extends GetView<WalletTransferController> {
  const WalletTransferScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Transfer",
        actions: [],
      ),
      // floatingActionButton: Obx(
      //   () => controller.isScrollToTopBtnVisible.value
      //       ? FloatingActionButton.small(
      //           onPressed: controller.scrollToTop,
      //           backgroundColor: kAccentColor,
      //           foregroundColor: kLightBackgroundColor,
      //           child: const Icon(Icons.keyboard_arrow_up),
      //         )
      //       : const SizedBox(),
      // ),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              Text(
                "Source Account",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kHalfSizedBox,
              walletTransferSourceWallet(media, colorScheme, controller),
              kBigSizedBox,
              Text(
                "Transfer to",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kSizedBox,
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    formFieldContainer(
                      colorScheme,
                      media,
                      containerHeight: 55,
                      child: AndroidTextFormField(
                        labelText: "Wallet Number",
                        controller: controller.walletNumberEC,
                        validator: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        focusNode: controller.walletNumberFN,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      containerHeight: 55,
                      child: AndroidTextFormField(
                        labelText: "Amount",
                        controller: controller.amountEC,
                        validator: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        focusNode: controller.amountFN,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      containerHeight: 55,
                      child: AndroidTextFormField(
                        labelText: "Description",
                        controller: controller.descriptionEC,
                        validator: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        focusNode: controller.descriptionFN,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: controller.onFieldSubmitted,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.height * .2),
              GetBuilder<WalletTransferController>(
                init: WalletTransferController(),
                builder: (controller) {
                  return AndroidElevatedButton(
                    title: "Confirm",
                    isLoading: controller.isSubmitting.value,
                    onPressed: controller.submitForm,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
