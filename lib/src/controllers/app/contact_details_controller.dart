import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/profile/views/contact_details/edit_contact_phone_otp/phone_otp/content/edit_business_name_dialog.dart';
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';
import 'package:suitess/src/services/api/api_url.dart';
import 'package:suitess/src/services/client/http_client_service.dart';

import '../../../app/screens/profile/views/contact_details/edit_contact_phone_otp/phone_otp/content/edit_address_dialog.dart';
import '../../constants/consts.dart';
import '../auth/user_controller.dart';

class ContactDetailsScreenController extends GetxController {
  static ContactDetailsScreenController get instance {
    return Get.find<ContactDetailsScreenController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    phoneNumberEC.text = user!.phone ?? "";
    addressEC.text = user!.settings!.address ?? "";
    userNameEC.text = user!.settings!.username ?? "";
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var phoneFormKey = GlobalKey<FormState>();
  var addressFormKey = GlobalKey<FormState>();
  var userNameFormKey = GlobalKey<FormState>();
  var user = UserController.instance.userModel.value.data;

  //================ Booleans =================\\
  var isSavingPhoneNumber = false.obs;
  var isSavingAddress = false.obs;
  var isSavingUserName = false.obs;
  var hasProperties = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var adderessClearButtonIsVisible = false.obs;
  var mapSuggestionsIsVisible = false.obs;

  //================ controllers =================\\

  var scrollController = ScrollController();
  var phoneNumberEC = TextEditingController();
  var addressEC = TextEditingController();
  var userNameEC = TextEditingController();

  //================ Focus Nodes =================\\

  var phoneNumberFN = FocusNode();
  var addressFN = FocusNode();
  var businessNameFN = FocusNode();

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
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

  //================= Edit Phone Number ===================//

  void showEditPhoneNumberDialog() {
    ApiProcessorController.warningSnack(
      "This option is not yet available.\nPhone OTP is not functional",
    );

    // var media = MediaQuery.of(Get.context!).size;
    // var colorScheme = Theme.of(Get.context!).colorScheme;
    // var controller = ContactDetailsScreenController.instance;

    // showDialog(
    //   context: Get.context!,
    //   useSafeArea: true,
    //   barrierDismissible: true,
    //   builder: (context) {
    //     return GestureDetector(
    //       onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
    //       child: editPhoneNumberDialog(media, colorScheme, controller),
    //     );
    //   },
    // );
  }

  phoneNumberOnSubmitted(String value) {
    savePhoneNumber();
  }

  Future<void> savePhoneNumber() async {
    if (phoneFormKey.currentState!.validate()) {
      var phoneNumberRegExp = RegExp(mobilePattern);

      if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your phone number");
        return;
      } else if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
        ApiProcessorController.warningSnack(
          "Please enter a valid phone number",
        );
        return;
      }

      isSavingPhoneNumber.value = true;
      await Future.delayed(const Duration(seconds: 3));
      isSavingPhoneNumber.value = false;
    }
  }

  //================= Edit Address ===================//

  void showEditAddressDialog() {
    var media = MediaQuery.of(Get.context!).size;
    var colorScheme = Theme.of(Get.context!).colorScheme;
    var controller = ContactDetailsScreenController.instance;

    showDialog(
      context: Get.context!,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: editAddressDialog(media, colorScheme, controller),
        );
      },
    );
  }

  addressOnChanged(String value) {
    if (value.isEmpty) {
      adderessClearButtonIsVisible.value = false;
      mapSuggestionsIsVisible.value = false;
    } else {
      adderessClearButtonIsVisible.value = true;
      mapSuggestionsIsVisible.value = true;
    }
  }

  clearAddressTextField() {
    addressEC.clear();
    adderessClearButtonIsVisible.value = false;
    mapSuggestionsIsVisible.value = false;
  }

  selectAddressSuggestion() {
    addressEC.text = "Enugu, Nigeria";
  }

  loadGoogleMaps() async {
    ApiProcessorController.warningSnack("Google maps is not available");
  }

  Future<void> saveAddress() async {
    if (addressFormKey.currentState!.validate()) {
      if (addressEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your phone number");
        return;
      } else if (addressEC.text.length < 3) {
        ApiProcessorController.warningSnack(
          "Please enter a valid address",
        );
        return;
      }

      isSavingAddress.value = true;
      await Future.delayed(const Duration(seconds: 3));
      ApiProcessorController.warningSnack(
        "Location Service is not yet available",
      );
      isSavingAddress.value = false;
    }
  }

  //================= Edit Business Name ===================//

  void showEditUserNameDialog() {
    var media = MediaQuery.of(Get.context!).size;
    var colorScheme = Theme.of(Get.context!).colorScheme;
    var controller = ContactDetailsScreenController.instance;

    showDialog(
      context: Get.context!,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: editUserNameDialog(media, colorScheme, controller),
        );
      },
    );
  }

  userNameOnSubmitted(String value) {
    saveUserName();
  }

  Future<void> saveUserName() async {
    if (userNameFormKey.currentState!.validate()) {
      if (userNameEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your username");
        return;
      } else if (userNameEC.text.length < 3) {
        ApiProcessorController.warningSnack(
          "Name must be more than 3 characters",
        );
        return;
      }

      isSavingUserName.value = true;

      // URL and token for the request
      var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.profile;
      var userToken = prefs.getString("userToken") ?? "";

      //HTTP Client Service
      var streamedResponse = await HttpClientService.updateProfile(
        url: url,
        token: userToken,
        businessName: userNameEC.text,
      );

      if (streamedResponse == null) {
        isSavingUserName.value = false;
        return;
      }

      // Log the status code and response body
      log("Response status code: ${streamedResponse.statusCode}");
      log("Response body: ${streamedResponse.body}");

      var responseJson = jsonDecode(streamedResponse.body);

      try {
        if (streamedResponse.statusCode == 200) {
          ApiProcessorController.successSnack(
            "Business name updated successfully",
          );
          await UserController.instance.getUserProfile();
          Get.close(0);
        } else {
          ApiProcessorController.errorSnack(responseJson["message"]);
        }
      } on SocketException {
        ApiProcessorController.errorSnack("Please connect to the internet");
      } catch (e) {
        log(e.toString());
      }

      isSavingUserName.value = false;
    }
  }
}
