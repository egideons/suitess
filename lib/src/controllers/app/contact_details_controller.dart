import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/screens/profile/views/contact_details/edit_contact_phone_otp/phone_otp/content/edit_address_dialog.dart';
import '../../../app/screens/profile/views/contact_details/edit_contact_phone_otp/phone_otp/content/edit_phone_number_dialog.dart';
import '../../constants/consts.dart';

class ContactDetailsScreenController extends GetxController {
  static ContactDetailsScreenController get instance {
    return Get.find<ContactDetailsScreenController>();
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

  //================ variables =================\\
  var phoneFormKey = GlobalKey<FormState>();
  var addressFormKey = GlobalKey<FormState>();
  var businessNameFormKey = GlobalKey<FormState>();

  //================ Booleans =================\\
  var isSavingPhoneNumber = false.obs;
  var isSavingAddress = false.obs;
  var isSavingBusinessName = false.obs;
  var hasProperties = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var mapSuggestionsIsVisible = false.obs;

  //================ controllers =================\\

  var scrollController = ScrollController();
  var phoneNumberEC = TextEditingController();
  var addressEC = TextEditingController();
  var businessNameEC = TextEditingController();

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

    var media = MediaQuery.of(Get.context!).size;
    var colorScheme = Theme.of(Get.context!).colorScheme;
    var controller = ContactDetailsScreenController.instance;

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
      mapSuggestionsIsVisible.value = false;
    } else {
      mapSuggestionsIsVisible.value = true;
    }
  }

  Future<void> saveAddress() async {
    isSavingAddress.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isSavingAddress.value = false;
  }

  //================= Edit Business Name ===================//

  void showEditBusinessNameDialog() {
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
          child: editPhoneNumberDialog(media, colorScheme, controller),
        );
      },
    );
  }

  Future<void> saveBusinessName() async {
    isSavingBusinessName.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isSavingBusinessName.value = false;
  }
}
