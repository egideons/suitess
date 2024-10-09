import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/containers/form_field_container.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/bank_transfer_controller.dart';
import '../../../../../../../theme/colors.dart';
import '../../../../../../../utils/buttons/android/android_elevated_button.dart';
import '../../../../../../../utils/components/my_app_bar.dart';
import '../../../../../../../utils/text_form_fields/android/android_textformfield.dart';
import '../../content/bank_transfer_source_wallet.dart';

class BankTransferScaffold extends GetView<BankTransferController> {
  const BankTransferScaffold({super.key});

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
      //           backgroundColor: colorScheme.secondary,
      //           foregroundColor: kWhiteBackgroundColor,
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
              bankTransferSourceWallet(media, colorScheme, controller),
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
              Obx(
                () {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: controller.showListOfBanksModalSheet,
                          borderRadius: BorderRadius.circular(10),
                          child: formFieldContainer(
                            colorScheme,
                            media,
                            containerHeight: 55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.selectedBank.value.isEmpty
                                      ? "Select Bank"
                                      : controller.selectedBank.value,
                                  textAlign: TextAlign.start,
                                  style: defaultTextStyle(
                                    color: controller.selectedBank.value.isEmpty
                                        ? kFormFieldTextColor.withOpacity(.5)
                                        : kFormFieldTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.inversePrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        kSmallSizedBox,
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: media.width / 2,
                            child: InkWell(
                              onTap: controller.showListOfBeneficiaries,
                              borderRadius: BorderRadius.circular(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Choose Beneficiary",
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      color: colorScheme.secondary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  kSmallWidthSizedBox,
                                  Icon(
                                    Icons.chevron_right,
                                    color: colorScheme.secondary,
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
                          containerHeight: 55,
                          child: AndroidTextFormField(
                            labelText: "Account Number",
                            controller: controller.accountNumberEC,
                            textInputAction: TextInputAction.next,
                            focusNode: controller.accountNumberFN,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.number,
                            onChanged: controller.accountNumberOnChanged,
                            validator: (value) {
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        Obx(() {
                          return controller.selectedAccountName.value.isEmpty
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    controller.selectedAccountName.value,
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      color: kTextBoldHeadingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                        }),
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
                  );
                },
              ),
              SizedBox(height: media.height * .12),
              GetBuilder<BankTransferController>(
                init: BankTransferController(),
                builder: (controller) {
                  return AndroidElevatedButton(
                    title: "Confirm",
                    isLoading: controller.isSubmitting.value,
                    onPressed: controller.submitBankTransferForm,
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
