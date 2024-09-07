import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/wallet/wallet_transfer/content/wallet_transfer_tx_details.dart';
import '../../../app/screens/wallet/wallet_transfer/content/wallet_transfer_tx_pin.dart';
import '../../../app/splash/successful/screen/success_screen.dart';
import '../../constants/consts.dart';
import '../../models/wallet/source_account_model.dart';
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
  var beneficiaryName = "".obs;
  var transactionCharge = 52.0.obs;

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

  //================ Wallet Transfer Form =================//
  final formKey = GlobalKey<FormState>();
  var walletNumberEC = TextEditingController();
  var amountEC = TextEditingController();
  var unformattedAmountText = "".obs;
  var descriptionEC = TextEditingController();

  var walletNumberFN = FocusNode();
  var amountFN = FocusNode();
  var descriptionFN = FocusNode();

  //================ Transaction Pin Form =================//
  final txPinFormKey = GlobalKey<FormState>();
  var txPin1EC = TextEditingController();
  var txPin2EC = TextEditingController();
  var txPin3EC = TextEditingController();
  var txPin4EC = TextEditingController();

  var txPin1FN = FocusNode();
  var txPin2FN = FocusNode();
  var txPin3FN = FocusNode();
  var txPin4FN = FocusNode();

  Future<void> confirmTxDetails() async {
    await showWalletTransferTxPinModalSheet();
  }

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

  onTxPinSubmitted(value) {
    submitTxPin();
  }

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

//Wallet Onchanged
  walletOnChanged(String value) async {
    if (value.isEmpty) {
      beneficiaryName.value = "";
    } else if (value.length == 10) {
      await Future.delayed(const Duration(seconds: 1));
      beneficiaryName.value = "Ifeanyi Okigbo";
    }
  }

  //================ Modal Bottom Sheets ================\\

  showWalletTransferTxDetailsModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;
    var transactionAmount = double.tryParse(unformattedAmountText.value);

    log("This is the Transaction Amount: $transactionAmount");

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height / 1.56, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: WalletTransferTxDetails(
            accountNumber: walletNumberEC.text,
            beneficiaryName: beneficiaryName.value,
            transactionAmount: transactionAmount,
            transactionCharge: transactionCharge.value,
          ),
        );
      },
    );
  }

  showWalletTransferTxPinModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height / 1.4, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const WalletTransferTxPin(),
        );
      },
    );
  }

  //================  Submit form =================//
  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (walletNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter a wallet number");
        return;
      } else if (amountEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter an amount");
        return;
      } else if (double.tryParse(unformattedAmountText.value)! <= 100) {
        ApiProcessorController.warningSnack("The amount is too small!");
        return;
      } else if (descriptionEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter a description");
        return;
      }
    }

    isSubmitting.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 300));

    await showWalletTransferTxDetailsModalSheet();

    isSubmitting.value = false;
    update();
  }

  Future<void> submitTxPin() async {
    Get.close(0);
    await await Future.delayed(const Duration(milliseconds: 300));
    await Get.off(
      () => const SuccessScreen(
        subtitle: "Your transaction was successful",
        isWalletTab: true,
      ),
      routeName: "/success-screen",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  //================= Transaction Pins Onchanged ======================\\
  txPin1Onchanged(value, context) {
    if (value.isEmpty) {
      return;
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  txPin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  txPin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  txPin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;

      update();
      return;
    }
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
