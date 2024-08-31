import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../constants/consts.dart';

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
  void onDaySelected(DateTime day, DateTime focusedDay) async {
    selectedDay = day;
    lastSelectedDate = selectedDay;
    dobEC.text = DateFormat("dd / MM / yyyy").format(selectedDay);
    log("Selected day ======> ${selectedDay.toString().split(" ")[0]}");
    update();
  }

  void selectDoBFunc() async {
    tableCalendarIsVisible.value = true;

    // var selectedDate = await showDatePicker(
    //   context: Get.context!,
    //   initialDate: lastSelectedDate ?? DateTime.now(),
    //   firstDate: DateTime.now(),
    //   lastDate: DateTime(2101),
    //   currentDate: DateTime.now(),
    //   cancelText: "Cancel",
    //   confirmText: "Confirm",
    // );

    // if (selectedDate != null) {
    //   dobEC.text = DateFormat("dd / MM / yyyy").format(selectedDate);
    //   lastSelectedDate = selectedDate;
    // }
  }

  submitSelectedDoB() async {
    tableCalendarIsVisible.value = false;
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (bvnEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your BVN");
        return;
      } else if (bvnEC.text.length != 11) {
        ApiProcessorController.errorSnack("Please enter a valid BVN");
        return;
      } else if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your phone number");
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid phone number");
        return;
      } else if (dobEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your Date of Birth");
        return;
      }

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
    }
  }
}
