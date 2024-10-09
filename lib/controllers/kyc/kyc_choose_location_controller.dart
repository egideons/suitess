import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../constants/consts.dart';
import '../../views/android/splash/loading/screen/android_loading_screen.dart';
import '../others/api_processor_controller.dart';
import '../others/loading_controller.dart';

class KycAddLocationController extends GetxController {
  static KycAddLocationController get instance {
    return Get.find<KycAddLocationController>();
  }

  @override
  void onInit() {
    super.onInit();
    log("This is the user token: $userToken");
  }

  //=========== Controllers ===========\\
  var scrollController = ScrollController().obs;
  var fixedContentScrollController = FixedExtentScrollController().obs;
  var userToken = prefs.getString("userToken");

  final cityEC = TextEditingController();
  final addressEC = TextEditingController();

  //=========== Focus Nodes ===========\\
  final cityFN = FocusNode();
  final addressFN = FocusNode();

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var statePickerIsEnabled = false.obs;
  var cityTextFieldIsEnabled = false.obs;
  var addressTextFieldIsEnabled = false.obs;
  var isCityValid = false.obs;
  var isAddressValid = false.obs;
  var formIsValid = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var selectedIndex = 0.obs;
  var responseMessage = "".obs;
  var selectedCountry = "Choose Country".obs;
  var selectedState = "Choose State".obs;

  //=========== List of countries ===========\\
  List<String> countries = [
    "Choose Country",
    // "Afghanistan",
    // "Albania",
    // "Algeria",
    // "Andorra",
    // "Angola",
    // "Antigua and Barbuda",
    // "Argentina",
    // "Armenia",
    // "Australia",
    // "Austria",
    // "Azerbaijan",
    // "Bahamas",
    // "Bahrain",
    // "Bangladesh",
    // "Barbados",
    // "Belarus",
    // "Belgium",
    // "Belize",
    // "Benin",
    // "Bhutan",
    // "Bolivia",
    // "Bosnia and Herzegovina",
    // "Botswana",
    // "Brazil",
    // "Brunei",
    // "Bulgaria",
    // "Burkina Faso",
    // "Burundi",
    // "Cabo Verde",
    // "Cambodia",
    // "Cameroon",
    // "Canada",
    // "Central African Republic",
    // "Chad",
    // "Chile",
    // "China",
    // "Colombia",
    // "Comoros",
    // "Congo",
    // "Costa Rica",
    // "Croatia",
    // "Cuba",
    // "Cyprus",
    // "Czech Republic",
    // "Denmark",
    // "Djibouti",
    // "Dominica",
    // "Dominican Republic",
    // "Ecuador",
    // "Egypt",
    // "El Salvador",
    // "Equatorial Guinea",
    // "Eritrea",
    // "Estonia",
    // "Eswatini",
    // "Ethiopia",
    // "Fiji",
    // "Finland",
    // "France",
    // "Gabon",
    // "Gambia",
    // "Georgia",
    // "Germany",
    // "Ghana",
    // "Greece",
    // "Grenada",
    // "Guatemala",
    // "Guinea",
    // "Guinea-Bissau",
    // "Guyana",
    // "Haiti",
    // "Honduras",
    // "Hungary",
    // "Iceland",
    // "India",
    // "Indonesia",
    // "Iran",
    // "Iraq",
    // "Ireland",
    // "Israel",
    // "Italy",
    // "Jamaica",
    // "Japan",
    // "Jordan",
    // "Kazakhstan",
    // "Kenya",
    // "Kiribati",
    // "Korea, North",
    // "Korea, South",
    // "Kosovo",
    // "Kuwait",
    // "Kyrgyzstan",
    // "Laos",
    // "Latvia",
    // "Lebanon",
    // "Lesotho",
    // "Liberia",
    // "Libya",
    // "Liechtenstein",
    // "Lithuania",
    // "Luxembourg",
    // "Madagascar",
    // "Malawi",
    // "Malaysia",
    // "Maldives",
    // "Mali",
    // "Malta",
    // "Marshall Islands",
    // "Mauritania",
    // "Mauritius",
    // "Mexico",
    // "Micronesia",
    // "Moldova",
    // "Monaco",
    // "Mongolia",
    // "Montenegro",
    // "Morocco",
    // "Mozambique",
    // "Myanmar",
    // "Namibia",
    // "Nauru",
    // "Nepal",
    // "Netherlands",
    // "New Zealand",
    // "Nicaragua",
    // "Niger",
    "Nigeria",
    // "North Macedonia",
    // "Norway",
    // "Oman",
    // "Pakistan",
    // "Palau",
    // "Palestine",
    // "Panama",
    // "Papua New Guinea",
    // "Paraguay",
    // "Peru",
    // "Philippines",
    // "Poland",
    // "Portugal",
    // "Qatar",
    // "Romania",
    // "Russia",
    // "Rwanda",
    // "Saint Kitts and Nevis",
    // "Saint Lucia",
    // "Saint Vincent and the Grenadines",
    // "Samoa",
    // "San Marino",
    // "Sao Tome and Principe",
    // "Saudi Arabia",
    // "Senegal",
    // "Serbia",
    // "Seychelles",
    // "Sierra Leone",
    // "Singapore",
    // "Slovakia",
    // "Slovenia",
    // "Solomon Islands",
    // "Somalia",
    // "South Africa",
    // "South Sudan",
    // "Spain",
    // "Sri Lanka",
    // "Sudan",
    // "Suriname",
    // "Sweden",
    // "Switzerland",
    // "Syria",
    // "Taiwan",
    // "Tajikistan",
    // "Tanzania",
    // "Thailand",
    // "Timor-Leste",
    // "Togo",
    // "Tonga",
    // "Trinidad and Tobago",
    // "Tunisia",
    // "Turkey",
    // "Turkmenistan",
    // "Tuvalu",
    // "Uganda",
    // "Ukraine",
    // "United Arab Emirates",
    // "United Kingdom",
    // "United States",
    // "Uruguay",
    // "Uzbekistan",
    // "Vanuatu",
    // "Vatican City",
    // "Venezuela",
    // "Vietnam",
    // "Yemen",
    // "Zambia",
    // "Zimbabwe",
  ];

  List<String> nigerianStates = [
    "Choose State",
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

  //=========== On changed Functions ===========\\
  onSelectedCountryChanged(controller, index) {
    controller.selectedCountry.value = controller.countries[index];

    if (controller.selectedCountry.value != "Choose Country") {
      statePickerIsEnabled.value = true;
      update();
      return;
    }
    statePickerIsEnabled.value = false;
    update();
  }

  onSelectedStateChanged(controller, index) {
    controller.selectedState.value = controller.nigerianStates[index];

    if (controller.selectedState.value != "Choose State") {
      cityTextFieldIsEnabled.value = true;
      update();
      return;
    }
    cityTextFieldIsEnabled.value = false;
    update();
  }

  cityOnChanged(value) {
    var cityNameRegExp = RegExp(namePattern);
    if (!cityNameRegExp.hasMatch(cityEC.text)) {
      isCityValid.value = false;
      addressTextFieldIsEnabled.value = false;
    } else {
      isCityValid.value = true;
      addressTextFieldIsEnabled.value = true;
    }
    update();
  }

  addressOnChanged(value) {
    var addressRegExp = RegExp(namePattern);
    if (!addressRegExp.hasMatch(addressEC.text)) {
      isAddressValid.value = false;
      setFormIsInvalid();
    } else {
      isAddressValid.value = true;
      setFormIsValid();
    }
    update();
  }

  //=========== Set form validity ===========\\
  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Submit form ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitForm();
    }
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Form submitted successfully");

      // Get.toNamed(Routes.chooseExperience, preventDuplicates: true);

      // Get.offAll(
      //   () => const ChooseExperience(),
      //   routeName: "/choose-experience",
      //   fullscreenDialog: true,
      //   curve: Curves.easeInOut,
      //   predicate: (routes) => false,
      //   popGesture: false,
      //   transition: Get.defaultTransition,
      // );

      await Get.offAll(
        () => AndroidLoadingScreen(
          loadData: LoadingController.instance.loadHome,
        ),
        routeName: "/loading-screen",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }
    isLoading.value = false;
    update();
  }

  skipPage() async {
    await Get.offAll(
      () => AndroidLoadingScreen(
        loadData: LoadingController.instance.loadHome,
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
