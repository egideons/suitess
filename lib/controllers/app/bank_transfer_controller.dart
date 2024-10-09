import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/models/bank/bank_model.dart';
import 'package:suitess/views/android/screens/wallet/bank_transfer/content/bank_transfer_tx_details.dart';
import 'package:suitess/views/android/screens/wallet/bank_transfer/content/bank_transfer_tx_pin.dart';
import 'package:suitess/views/android/screens/wallet/bank_transfer/content/list_of_banks_modal.dart';
import 'package:suitess/views/android/screens/wallet/bank_transfer/content/list_of_beneficiaries_modal.dart';
import 'package:suitess/views/android/splash/successful/screen/android_success_screen.dart';

import '../../models/bank/beneficiary_model.dart';
import '../../models/wallet/source_account_model.dart';
import '../others/api_processor_controller.dart';

class BankTransferController extends GetxController {
  static BankTransferController get instance {
    return Get.find<BankTransferController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    amountEC.addListener(formatAmount);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    amountEC.removeListener(formatAmount);
    amountEC.dispose();
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
  void scrollToTop() => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );

  //================ variables =================\\
  var isRefreshing = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var hasNotifications = true.obs;
  var isSubmitting = false.obs;
  var transactionCharge = 52.0.obs;

  //================ controllers =================\\
  var bankCardPageController = PageController();
  var scrollController = ScrollController();

  //================ Source Account Card =================//
  var sourceAccounts = [
    const SourceAccountModel(
        availableBalance: 2372054.02, walletName: "Main bank"),
    const SourceAccountModel(
        availableBalance: 1272054.34, walletName: "Spending bank"),
    const SourceAccountModel(
        availableBalance: 4372054.89, walletName: "Savings bank"),
  ];

  //================ Bank Transfer Form =================//
  final formKey = GlobalKey<FormState>();
  var accountNumberEC = TextEditingController();
  var bankSearchEC = TextEditingController();
  var beneficiarySearchEC = TextEditingController();
  var amountEC = TextEditingController();
  var unformattedAmountText = "".obs;
  var selectedBank = "".obs;
  var selectedAccountName = "".obs;
  var selectedBeneficiary = {
    "name": "",
    "accountNumber": "",
    "bankName": "",
  };
  var descriptionEC = TextEditingController();
  var accountNumberFN = FocusNode();
  var bankSearchFN = FocusNode();
  var beneficiarySearchFN = FocusNode();
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
    await showBankTransferTxPinModalSheet();
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

  String formatWithCommas(String value) {
    // Convert the value to a number
    final number = double.parse(value);

    // Format the number with commas
    return number.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
  }

  //================  On FieldSubmitted =================//
  onFieldSubmitted(value) {
    submitBankTransferForm();
  }

  //================= Account Number Onchanged ======================\\
  accountNumberOnChanged(String value) async {
    if (value.isEmpty) {
      selectedAccountName.value = "";
    } else if (value.length == 10) {
      await Future.delayed(const Duration(seconds: 1));
      selectedAccountName.value = beneficiaryModel.name;
    }
  }

  //================ Modal Bottom Sheets ================\\

  //Select Bank Section
  var bankModel = BankModel(
    name: "Suitess Bank",
    code: "1234",
    ussdTemplate: "",
    baseUssdCode: "",
    transferUssdTemplate: "",
    bankId: "",
    nipBankCode: "",
  );

  selectBank(index) {
    Get.back();
    selectedBank.value = bankModel.name;
  }

  showListOfBanksModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const ListOfBanksModal(),
        );
      },
    );
  }

  //Select Beneficiary Section
  var beneficiaryModel = BeneficiaryModel(
    name: "Gideon Chukwuoma Chimemerie",
    bankCode: "1234",
    accountNumber: "1234567890",
    bankName: "Suitess Bank",
  );

  selectBeneficiary(index) {
    Get.back();
    selectedBeneficiary["name"] = beneficiaryModel.name;
    selectedBeneficiary["accountNumber"] = beneficiaryModel.accountNumber;
    selectedBeneficiary["bankName"] = beneficiaryModel.bankName;
    selectedAccountName.value = selectedBeneficiary["name"] ?? "";
    accountNumberEC.text = selectedBeneficiary["accountNumber"] ?? "";
    selectedBank.value = selectedBeneficiary["bankName"] ?? "";
  }

  showListOfBeneficiaries() async {
    var media = MediaQuery.of(Get.context!).size;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const ListOfBeneficiariesModal(),
        );
      },
    );
  }

  //Bank Transfer Details
  showBankTransferTxDetailsModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;
    var transactionAmount = double.tryParse(unformattedAmountText.value);
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
          child: BankTransferTxDetails(
            accountNumber: accountNumberEC.text,
            beneficiaryBank: selectedBank.value,
            beneficiaryName: selectedAccountName.value,
            transactionAmount: transactionAmount,
            transactionCharge: transactionAmount,
          ),
        );
      },
    );
  }

  //Bank Transfer Transaction Pin
  showBankTransferTxPinModalSheet() async {
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
          child: const BankTransferTxPin(),
        );
      },
    );
  }

  //================  Submit form =================//
  Future<void> submitBankTransferForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (selectedBank.value.isEmpty) {
        ApiProcessorController.warningSnack("Please select a bank");
        return;
      } else if (accountNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter a bank number");
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

    await showBankTransferTxDetailsModalSheet();

    isSubmitting.value = false;
    update();
  }

  Future<void> submitTxPin() async {
    Get.close(0);
    await await Future.delayed(const Duration(milliseconds: 300));
    await Get.off(
      () => const AndroidSuccessScreen(
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
  txPin1Onchanged(String value, context) {
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
}
