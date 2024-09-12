import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../constants/consts.dart';
import '../others/loading_controller.dart';

class WalletIntroController extends GetxController {
  static WalletIntroController get instance {
    return Get.find<WalletIntroController>();
  }

  //================== Variables ====================\\
  DateTime? lastSelectedDate;
  var selectedDay = DateTime.now();

  //================== Booleans ====================\\
  var isPhoneNumberValid = false.obs;
  var tableCalendarIsVisible = false.obs;
  var isLoading = false.obs;

  //================== Keys ====================\\
  final formKey = GlobalKey<FormState>();

  //================== Controllers ====================\\
  var pageController = PageController();
  var bvnEC = TextEditingController();
  var phoneNumberEC = TextEditingController();
  var dobEC = TextEditingController();

  //================== Focus Nodes ====================\\
  var bvnFN = FocusNode();
  var phoneNumberFN = FocusNode();
  var dobFN = FocusNode();

  //=========== Page 1 ============\\
  navigateToPage2() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //=========== Page 2 ============\\
  bvnOnChanged(String value) {
    if (value.length == 11) {
      isPhoneNumberValid.value = true;
    } else {
      isPhoneNumberValid.value = false;
    }
    update();
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

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
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

      log("Got here");

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      ApiProcessorController.successSnack("Wallet created successfully");
      isLoading.value = false;
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
    }
  }
}