import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/src/routes/routes.dart';

class AddPropertyController extends GetxController {
  static AddPropertyController get instance {
    return Get.find<AddPropertyController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    propertyPricingEC.addListener(formatAmount);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    propertyPricingEC.removeListener(formatAmount);
    propertyPricingEC.dispose();
  }

  //================ variables =================\\
  var isScrollToTopBtnVisible = false.obs;
  var isNegotiable = true.obs;
  var isLoading = false.obs;
  var state = "".obs;
  var responseMessage = "".obs;
  var unformattedAmountText = "".obs;
  var formkey = GlobalKey<FormState>();

  //================ controllers =================\\
  var scrollController = ScrollController();

  var propertyTitleEC = TextEditingController();
  var propertyTypeEC = TextEditingController();
  var propertyCategoryEC = TextEditingController();
  var propertyUnitsEC = TextEditingController();
  var propertySqrFtEC = TextEditingController();
  var propertyRoomsEC = TextEditingController();
  var propertyBathsEC = TextEditingController();
  var propertyPricingEC = TextEditingController();
  var propertyDescriptionEC = TextEditingController();
  var propertyAddressEC = TextEditingController();
  var propertyStateEC = TextEditingController();
  var propertyLocalityEC = TextEditingController();

  //================ Focus Nodes =================\\
  var propertyTitleFN = FocusNode();
  var propertyTypeFN = FocusNode();
  var propertyCategoryFN = FocusNode();
  var propertyUnitsFN = FocusNode();
  var propertySqrFtFN = FocusNode();
  var propertyRoomsFN = FocusNode();
  var propertyBathsFN = FocusNode();
  var propertyPricingFN = FocusNode();
  var propertyDescriptionFN = FocusNode();
  var propertyAddressFN = FocusNode();
  var propertyStateFN = FocusNode();
  var propertyLocalityFN = FocusNode();

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

  //=========== Property Types ===============\\
  var propertyTypes = <String>[
    "Flat",
    "Apartment",
    "Commercial Properties",
    "Shortlets",
    "Workspace",
    "Lands",
  ];

  void setSelectedPropertyType(String? propertyType) {
    if (propertyType != null) {
      propertyTypeEC.text = propertyType;
      log("Selected Property type: ${propertyTypeEC.text}");
    }
  }

  //=========== Property categories ===============\\
  var propertyCategories = <String>[
    "Rent",
    "Lease",
    "Sale",
  ];

  void setSelectedPropertyCategory(String? propertyCategory) {
    if (propertyCategory != null) {
      propertyCategoryEC.text = propertyCategory;
      log("Selected Property category: ${propertyCategoryEC.text}");
    }
  }

  void formatAmount() {
    // Get the current value
    String currentValue = propertyPricingEC.text;

    // Remove any commas to get the unformatted value
    String rawValue = currentValue.replaceAll(',', '');

    // Store the unformatted value
    unformattedAmountText.value = rawValue;

    // Check if it's a valid number
    if (rawValue.isNotEmpty && double.tryParse(rawValue) != null) {
      // Format the number with commas
      String formattedValue = formatWithCommas(rawValue);

      // Update the text controller with the formatted value
      propertyPricingEC.value = propertyPricingEC.value.copyWith(
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

  //=========== Property states ===============\\
  var propertyStates = <String>[
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "FCT-Abuja",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
  ];

  void setSelectedPropertyState(String? propertyState) {
    if (propertyState != null) {
      propertyStateEC.text = propertyState;
      log("Selected state: ${propertyStateEC.text}");
    }
  }

  Future<void> submitForm() async {
    Get.toNamed(Routes.uploadPropertyImages, preventDuplicates: true);

/* 
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      if (propertyTitleEC.text.isEmpty) {
        ApiProcessorController.warningSnack(
          "Please enter the title",
        );
        return;
      } else if (propertyTitleEC.text.length < 3) {
        ApiProcessorController.warningSnack(
          "Please enter a valid title",
        );
        return;
      } else if (propertyTypeEC.text.isEmpty) {
        ApiProcessorController.warningSnack(
          "Please select a property type",
        );
        return;
      } else if (propertyUnitsEC.text.isEmpty) {
        ApiProcessorController.warningSnack(
          "Please enter the number of units",
        );
        return;
      } else if (propertyCategoryEC.text.isEmpty) {
        ApiProcessorController.warningSnack(
          "Please select a category",
        );
        return;
      }
      if (propertySqrFtEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please enter the Square Ft",
        );
        return;
      } else if (propertyPricingEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please enter the pricing",
        );
        return;
      } else if (propertyDescriptionEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please enter the description",
        );
        return;
      } else if (propertyAddressEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please enter the address",
        );
        return;
      } else if (propertyStateEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please select a state",
        );
        return;
      } else if (propertyLocalityEC.text.isEmpty) {
        ApiProcessorController.errorSnack(
          "Please enter the locality",
        );
        return;
      }

      isLoading.value = true;

      var url = ApiUrl.businessBaseUrl +
          ApiUrl.business +
          ApiUrl.createPropertyBusiness;

      // var userToken = prefs.getString("userToken") ?? "";

      Map data = {
        "title": propertyTitleEC.text,
        "type": propertyTypeEC.text,
        "ads_type": propertyCategoryEC.text,
        "square_feet": propertySqrFtEC.text,
        "rooms": propertyRoomsEC.text,
        "bathrooms": propertyBathsEC.text,
        "price": propertyPricingEC.text,
        "description": propertyDescriptionEC.text,
        "negotiable": isNegotiable.value,
        "address": propertyAddressEC.text,
        "state": propertyStateEC.text,
        "locality": propertyLocalityEC.text
      };

      log("This is the Url: $url");
      log("This is the Data: $data");


      //HTTP Client Service
      http.Response? response =
          await HttpClientService.postRequest(url, userToken, data);

      if (response == null) {
        isLoading.value = false;
        update();
        return;
      }

      try {
        var responseJson = jsonDecode(response.body);

        log("This is the response body ====> ${response.body}");

        responseMessage.value = responseJson["message"];

        //Map the response json to the model provided
        // addPropertyResponse.value = addPropertyResponseModel.fromJson(responseJson);
        // responseMessage.value = addPropertyResponse.value.message;

        if (response.statusCode == 200) {
          //Display Snackbar
          ApiProcessorController.successSnack("Successful");

          //Navigate to next screen
          Get.toNamed(Routes.uploadPropertyImages, preventDuplicates: true);
        } else {
          ApiProcessorController.warningSnack(responseMessage.value);
          log("Request failed with status: ${response.statusCode}");
          log("Response body: ${response.body}");
        }
      } catch (e) {
        log(e.toString());
      }

      isLoading.value = false;
    }
    */
  }
}
