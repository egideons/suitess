import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitess/app/splash/loading/screen/loading_screen.dart';
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';
import 'package:suitess/src/controllers/others/loading_controller.dart';

import '../../constants/consts.dart';

class WalletIntroController extends GetxController {
  static WalletIntroController get instance {
    return Get.find<WalletIntroController>();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();

    // Listen for page changes and update currentPage
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
      log("Current Page: ${currentPage.value}");
    });
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  //================== Variables ====================\\
  DateTime? lastSelectedDate;
  var selectedDay = DateTime.now();
  var currentPage = 0.obs;

  //================== Booleans ====================\\
  var isPhoneNumberValid = false.obs;
  var tableCalendarIsVisible = false.obs;
  var isLoading = false.obs;

  //================== Keys ====================\\
  final form1Key = GlobalKey<FormState>();
  final form2Key = GlobalKey<FormState>();

  //================== Controllers ====================\\
  var pageController = PageController();
  var bvnEC = TextEditingController();
  var phoneNumberEC = TextEditingController();
  var dobEC = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );

  //================== Focus Nodes ====================\\
  var bvnFN = FocusNode();
  var phoneNumberFN = FocusNode();
  var dobFN = FocusNode();

  Future<bool> handleBackNavigation() async {
    if (currentPage.value > 0) {
      // If not on the first page, go to the previous page
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return false; // Prevents the default back action
    }
    return true; // Allows the default back action (e.g. closing the app)
  }

  goBackToPage0() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  goBackToPage1() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //=========== Page 1 ============\\
  navigateToPage2() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //=========== Page 2 ============\\
  navigateToPage3() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bvnOnChanged(String value) {
    if (value.length == 11) {
      isPhoneNumberValid.value = true;
    } else {
      isPhoneNumberValid.value = false;
    }
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
      isPhoneNumberValid.value = false;
    } else {
      isPhoneNumberValid.value = true;
    }
  }

  //====================== Calendar Functions =======================\\
  void selectDoBFunc() async {
    var media = MediaQuery.of(Get.context!).size;
    var colorScheme = Theme.of(Get.context!).colorScheme;

    showCupertinoModalPopup(
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: media.height / 2,
          child: CupertinoDatePicker(
            backgroundColor: colorScheme.surface,
            initialDateTime: lastSelectedDate ?? DateTime.now(),
            dateOrder: DatePickerDateOrder.mdy,
            use24hFormat: false,
            mode: CupertinoDatePickerMode.date,
            itemExtent: 60,
            maximumDate: DateTime.now(),
            minimumDate: DateTime(1940),
            onDateTimeChanged: (newTime) {
              selectedDay = newTime;
              lastSelectedDate = selectedDay;
              dobEC.text = DateFormat("dd / MM / yyyy").format(selectedDay);
              log(dobEC.text);
            },
          ),
        );
      },
    );
  }

  Future<void> submitKYCForm() async {
    if (form1Key.currentState!.validate()) {
      form1Key.currentState!.save();
      if (bvnEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your BVN");
        return;
      } else if (bvnEC.text.length != 11) {
        ApiProcessorController.warningSnack("Please enter a valid BVN");
        return;
      } else if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your phone number");
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.warningSnack(
            "Please enter a valid phone number");
        return;
      } else if (dobEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please select your Date of Birth");
        return;
      }

      // Parse the date entered in dobEC.text
      // DateTime selectedDate = DateTime.tryParse(dobEC.text) ?? DateTime.now();

      // Calculate the date 10 years ago from today
      DateTime tenYearsAgo =
          DateTime.now().subtract(const Duration(days: 365 * 10));

      // Check if the selected date is younger than 10 years ago
      if (selectedDay.isAfter(tenYearsAgo)) {
        ApiProcessorController.warningSnack(
          "You must be at least 10 years old",
        );
        return;
      }

      // Prevent the user from selecting today's date as DOB
      if (dobEC.text == DateTime.now().toString()) {
        ApiProcessorController.warningSnack("Today cannot be the DOB");
        return;
      }
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      navigateToPage3();
      isLoading.value = false;
    }
  }

//================ Transaction PIN ===================\\
  var txPin1EC = TextEditingController();
  var txPin2EC = TextEditingController();
  var txPin3EC = TextEditingController();
  var txPin4EC = TextEditingController();

  var txPin1FN = FocusNode();
  var txPin2FN = FocusNode();
  var txPin3FN = FocusNode();
  var txPin4FN = FocusNode();

  //================= Transaction Pins Onchanged ======================\\
  txPin1Onchanged(value, context) {
    if (value.isEmpty) {
      return;
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;

      return;
    }
  }

  //=========== on Submitted ===========\\
  onTxPinSubmitted(value) {
    submitTXPIN();
  }

  Future<void> submitTXPIN() async {
    if (form2Key.currentState!.validate()) {
      form2Key.currentState!.save();
      if (txPin1EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 1");
        return;
      } else if (txPin2EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 2");
        return;
      } else if (txPin3EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 3");
        return;
      } else if (txPin4EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 4");
        return;
      }

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      ApiProcessorController.successSnack("Wallet created successfully");
      prefs.setBool("hasViewedWalletIntro", true);

      await Get.offAll(
        () => LoadingScreen(
          loadData: LoadingController.instance.loadWalletTab,
        ),
        routeName: "/loading-screen",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
      isLoading.value = false;
    }
  }
}
