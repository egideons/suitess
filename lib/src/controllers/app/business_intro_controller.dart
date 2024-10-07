import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/splash/loading/screen/loading_screen.dart';
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/loading_controller.dart';

import '../others/api_processor_controller.dart';

class BusinessIntroController extends GetxController {
  static BusinessIntroController get instance {
    return Get.find<BusinessIntroController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
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
    scrollController.dispose();
  }

  //================== Booleans ====================\\
  var isFormValid = false.obs;
  var isLoading = false.obs;
  var businessIsLandsAndProperties = false.obs;
  var isScrollToTopBtnVisible = false.obs;

  //================== Keys ====================\\
  final formKey = GlobalKey<FormState>();

  //================ Variables =================\\
  var currentPage = 0.obs;

  //================ Controllers =================\\
  var pageController = PageController();
  var scrollController = ScrollController();

  var businessNameEC = TextEditingController();
  var businessTINEC = TextEditingController();

  //================ Focus Nodes =================\\
  var businessNameFN = FocusNode();
  var businessTINFN = FocusNode();

//================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );

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

  //=========== Page 1 ============\\
  navigateToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //=========== Page 2 ============\\
  navigateToPage2() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  navigateToPage3(bool value) {
    businessIsLandsAndProperties.value = value;

    log("Selected option is lands and properties: $value");
    log("Selected option is lands and properties: ${businessIsLandsAndProperties.value}");

    if (businessIsLandsAndProperties.value == true) {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      ApiProcessorController.warningSnack("This option is not yet available");
    }
  }

  onFieldSubmitted(value) {
    submitForm();
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (businessNameEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your business name");
        return;
      } else if (businessNameEC.text.length < 3) {
        ApiProcessorController.warningSnack(
          "Please enter a valid business name",
        );
        return;
      }

      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      if (businessIsLandsAndProperties.value == true) {
        goToLandsAndProperties();
      } else {
        goToHotelManagement();
      }

      // // URL and token for the request
      // var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.profile;
      // var userToken = prefs.getString("userToken") ?? "";

      // //HTTP Client Service
      // var streamedResponse = await HttpClientService.updateProfile(
      //   url: url,
      //   token: userToken,
      //   businessName: businessNameEC.text,
      // );

      // if (streamedResponse == null) {
      //   isLoading.value = false;
      //   ApiProcessorController.errorSnack("Failed to create business");
      //   return;
      // }

      // // Log the status code and response body
      // log("Response status code: ${streamedResponse.statusCode}");
      // log("Response body: ${streamedResponse.body}");

      // if (streamedResponse.statusCode == 200) {
      //   ApiProcessorController.successSnack("Business created successfully");

      //   if (businessIsLandsAndProperties.value == true) {
      //     goToLandsAndProperties();
      //   } else {
      //     goToHotelManagement();
      //   }
      //   // await UserController.instance.getUserProfile();
      // } else {
      //   ApiProcessorController.errorSnack("Failed to create business");
      // }

      isLoading.value = false;
    }
  }

  goToLandsAndProperties() async {
    prefs.setBool("hasBusiness", true);
    prefs.setBool(
      "businessIsLandsAndProperties",
      businessIsLandsAndProperties.value,
    );
    prefs.setString("nameOfBusiness", businessNameEC.text);

    await Get.off(
      () => LoadingScreen(
        loadData: LoadingController.instance.loadLandsAndProperties,
      ),
      routeName: "/loading-screen",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  goToHotelManagement() async {
    ApiProcessorController.errorSnack("This option is not yet available");
    // prefs.setBool("hasBusiness", true);
    // prefs.setBool(
    //   "businessIsLandsAndProperties",
    //   businessIsLandsAndProperties.value,
    // );
    // prefs.setString("nameOfBusiness", businessNameEC.text);

    // await Get.off(
    //   () => LoadingScreen(
    //     loadData: LoadingController.instance.loadHotelManagement,
    //   ),
    //   routeName: "/loading-screen",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }
}
