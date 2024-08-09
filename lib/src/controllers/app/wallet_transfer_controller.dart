import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/wallet/wallet_transfer/content/wallet_transfer_tx_details.dart';
import '../../models/source_account_model.dart';
import '../others/api_processor_controller.dart';

class WalletTransferController extends GetxController {
  static WalletTransferController get instance {
    return Get.find<WalletTransferController>();
  }

  //================ variables =================\\
  var isRefreshing = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var hasNotifications = true.obs;
  var isSubmitting = false.obs;

  //================ controllers =================\\
  var walletCardPageController = PageController();
  var scrollController = ScrollController();

  //================ Source Account Card =================//
  var sourceAccounts = [
    const SourceAccountModel(
        availableBalance: 2372054.02, walletName: "Main wallet"),
    const SourceAccountModel(
        availableBalance: 1272054.34, walletName: "Spending wallet"),
    const SourceAccountModel(
        availableBalance: 4372054.89, walletName: "Savings wallet"),
  ];

  //================ Form =================//
  final formKey = GlobalKey<FormState>();
  var walletNumberEC = TextEditingController();
  var amountEC = TextEditingController();
  var unformattedAmountText = "".obs;
  var descriptionEC = TextEditingController();

  var walletNumberFN = FocusNode();
  var amountFN = FocusNode();
  var descriptionFN = FocusNode();

  void formatAmount() {
    // Get the current value
    String currentValue = amountEC.text;

    // Remove any commas to get the unformatted value
    String rawValue = currentValue.replaceAll(',', '');

    // Store the unformatted value
    unformattedAmountText.value = rawValue;

    // Check if it's a valid number
    if (rawValue.isNotEmpty && double.tryParse(rawValue) != null) {
      // Format the number with commas
      String formattedValue = formatWithCommas(rawValue);

      // Update the text controller with the formatted value
      amountEC.value = amountEC.value.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }
  }

  String formatWithCommas(String value) {
    // Convert the value to a number
    final number = double.parse(value);

    // Format the number with commas
    return number.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    amountEC.removeListener(formatAmount);
    amountEC.dispose();
  }

  //================  On FieldSubmitted =================//
  onFieldSubmitted(value) {
    submitForm();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    amountEC.addListener(formatAmount);
  }

  //================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }
  //================ Modal Bottom Sheets ================\\

  showWalletTransferTxDetailsModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height / 2, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const WalletTransferTxDetails(),
        );
      },
    );
  }

  //================  Submit form =================//
  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (walletNumberEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter a wallet number");
        return;
      } else if (amountEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter an amount");
        return;
      }
    } else if (descriptionEC.text.isEmpty) {
      ApiProcessorController.errorSnack("Please enter a description");
      return;
    }

    isSubmitting.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 300));

    await showWalletTransferTxDetailsModalSheet();

    isSubmitting.value = false;
    update();
  }

  //================ Scroll Listener =================//

  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }
}
