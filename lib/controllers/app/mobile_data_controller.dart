import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/screens/wallet/mobile_data/content/android_list_of_mobile_data_billers_modal.dart';
import 'package:suitess/views/android/screens/wallet/mobile_data/content/android_list_of_mobile_data_plans_modal.dart';
import 'package:suitess/views/android/screens/wallet/mobile_data/content/android_mobile_data_pin.dart';
import 'package:suitess/views/android/splash/successful/screen/android_success_screen.dart';

import '../../constants/consts.dart';
import '../../models/network_providers/mobile_data_biller_model.dart';
import '../../models/network_providers/mobile_data_plans_model.dart';
import '../others/api_processor_controller.dart';

class MobileDataController extends GetxController {
  static MobileDataController get instance {
    return Get.find<MobileDataController>();
  }

  @override
  void onInit() {
    super.onInit();
    amountEC.addListener(formatAmount);
  }

  @override
  void onClose() {
    super.onClose();
    amountEC.removeListener(formatAmount);
    amountEC.dispose();
  }

  //================ variables =================\\
  final formKey = GlobalKey<FormState>();
  var isPhoneNumberValid = false.obs;
  var mobilePlanFieldIsEnabled = false.obs;
  var isSubmitting = false.obs;

  //================ controllers =================\\
  var bankCardPageController = PageController();
  var scrollController = ScrollController();

  //================ Airtime Purchase Form =================//
  var billerEC = TextEditingController();
  var billerSearchEC = TextEditingController();
  var mobileDataPlanSearchEC = TextEditingController();
  var phoneNumberEC = TextEditingController();
  var amountEC = TextEditingController();
  var descriptionEC = TextEditingController();
  var unformattedAmountText = "".obs;
  var selectedBiller = "".obs;
  var selectedMobileDataPlan = "".obs;
  var mobileDataPlan = MobileDataPlanModel(
    name: "50GB for 30 days",
    price: 11000,
    code: "",
  );
  var billerFN = FocusNode();
  var billerSearchFN = FocusNode();
  var mobileDataPlanSearchFN = FocusNode();
  var phoneNumberFN = FocusNode();
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

  //================ Modal Bottom Sheets ================\\

  //Select Biller Section
  var mobileDataBillers = [
    MobileDataBillerModel(
      name: "MTN",
      code: "1234",
    ),
    MobileDataBillerModel(
      name: "9Mobile",
      code: "1234",
    ),
    MobileDataBillerModel(
      name: "Glo",
      code: "1234",
    ),
    MobileDataBillerModel(
      name: "Airtel",
      code: "1234",
    ),
  ];

  selectBiller(index) async {
    Get.back();
    selectedBiller.value = mobileDataBillers[index].name;
    billerEC.text = selectedBiller.value;
    mobilePlanFieldIsEnabled.value = true;
  }

  showListOfBillers() async {
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
          child: const AndroidListOfMobileDataBillersModal(),
        );
      },
    );
  }

  selectMobileDataPlan(index) async {
    Get.back();
    selectedMobileDataPlan.value = mobileDataPlan.name;
    amountEC.text = mobileDataPlan.price.toString();
    await Future.delayed(const Duration(milliseconds: 500));
    if (phoneNumberEC.text.isEmpty) {
      phoneNumberFN.requestFocus();
    }
  }

  showListOfMobileDataPlans() async {
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
          child: const AndroidListOfMobileDataPlansModal(),
        );
      },
    );
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
      isPhoneNumberValid.value = false;
    } else {
      isPhoneNumberValid.value = true;
    }
    update();
  }

  //Airtime Transaction Pin
  showMobileDataTxPinModal() async {
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
          child: const AndroidMobileDataPin(),
        );
      },
    );
  }

  onTxPinSubmitted(value) {
    submitTxPin();
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
    submitMobileDataForm();
  }

  //================  Submit form =================//
  Future<void> submitMobileDataForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (selectedBiller.value.isEmpty) {
        ApiProcessorController.warningSnack("Please select a network provider");
        return;
      } else if (billerEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please select a network provider");
        return;
      } else if (selectedMobileDataPlan.value.isEmpty) {
        ApiProcessorController.warningSnack("Please select a data plan");
        return;
      } else if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter a phone number");
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.warningSnack(
            "Please enter a valid phone number");
        return;
      } else if (amountEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter an amount");
        return;
      } else if (descriptionEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter a description");
        return;
      }
    }

    isSubmitting.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 300));

    await showMobileDataTxPinModal();

    isSubmitting.value = false;
    update();
  }

  Future<void> submitTxPin() async {
    billerEC.clear();
    phoneNumberEC.clear();
    amountEC.clear();
    descriptionEC.clear();

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

    txPin1EC.clear();
    txPin2EC.clear();
    txPin3EC.clear();
    txPin4EC.clear();
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
