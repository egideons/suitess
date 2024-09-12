import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../others/api_processor_controller.dart';

class BusinessIntroController extends GetxController {
  static BusinessIntroController get instance {
    return Get.find<BusinessIntroController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================== Booleans ====================\\
  var isFormValid = false.obs;
  var isLoading = false.obs;

  //================== Keys ====================\\
  final formKey = GlobalKey<FormState>();

  //================ variables =================\\
  var isScrollToTopBtnVisible = false.obs;

  //================ controllers =================\\
  var pageController = PageController();
  var scrollController = ScrollController();

//================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

//================ Scroll Listener =================//

  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
    }
  }

  //=========== Page 1 ============\\
  navigateToPage2() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  navigateToPage3() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // if (bvnEC.text.isEmpty) {
      //   ApiProcessorController.warningSnack("Please enter your BVN");
      //   return;
      // } else if (bvnEC.text.length != 11) {
      //   ApiProcessorController.warningSnack("Please enter a valid BVN");
      //   return;
      // } else if (phoneNumberEC.text.isEmpty) {
      //   ApiProcessorController.warningSnack("Please enter your phone number");
      //   return;
      // } else if (isPhoneNumberValid.value == false) {
      //   ApiProcessorController.warningSnack(
      //       "Please enter a valid phone number");
      //   return;
      // } else if (dobEC.text.isEmpty) {
      //   ApiProcessorController.warningSnack("Please select your Date of Birth");
      //   return;
      // }

      log("Got here");

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Business created successfully");
      isLoading.value = false;

      // prefs.setBool("hasBusiness", true);

      // await Get.off(
      //   () => LoadingScreen(
      //     loadData: LoadingController.instance.loadMyBusiness,
      //   ),
      //   routeName: "/loading-screen",
      //   fullscreenDialog: true,
      //   curve: Curves.easeInOut,
      //   popGesture: false,
      //   transition: Get.defaultTransition,
      // );
    }
  }
}
