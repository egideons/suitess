import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';

class AddPropertyController extends GetxController {
  static AddPropertyController get instance {
    return Get.find<AddPropertyController>();
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
  var isScrollToTopBtnVisible = false.obs;
  var isNegotiable = true.obs;
  var isLoading = false.obs;
  var state = "".obs;
  var responseMessage = "".obs;
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

      var userToken = prefs.getString("userToken") ?? "";

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

        //Map the response json to the model provided
        // addPropertyResponse.value = addPropertyResponseModel.fromJson(responseJson);
        // responseMessage.value = addPropertyResponse.value.message;

        if (response.statusCode == 200) {
          //Display Snackbar
          ApiProcessorController.successSnack("Successful");
        } else {
          // ApiProcessorController.warningSnack(responseMessage.value);
          log("Request failed with status: ${response.statusCode}");
          log("Response body: ${response.body}");
        }
      } catch (e) {
        log(e.toString());
      }

      isLoading.value = false;
    }
  }
}
