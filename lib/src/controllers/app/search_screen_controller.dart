import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/search/content/search_filter_bottom_modal_sheet.dart';
import '../../models/property_category_model.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController get instance {
    return Get.find<SearchScreenController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    searchFN.requestFocus();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ Controllers =================\\

  var scrollController = ScrollController();
  var searchEC = TextEditingController();
  var searchFilterLocationEC = TextEditingController();
  var searchFilterAdvertCategoryEC = TextEditingController();
  var searchFilterNumOfBedroomsEC = TextEditingController();
  var searchFilterPriceMinEC = TextEditingController();
  var searchFilterPriceMaxEC = TextEditingController();

  //================ Focus Nodes =================\\

  var searchFN = FocusNode();
  var searchFilterNumOfBedroomsFN = FocusNode();

  //================ Booleans =================\\
  var isRefreshing = false.obs;
  var isScrollToTopBtnVisible = false.obs;

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
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

//================ Search Filter Screen ================\\

  showSearchFilterDraggableScrollSheet(BuildContext context, Size media) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,
      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const SearchFilterBottomModalSheet(),
        );
      },
    );
  }

//=========== Filter Location =================\\
  var searchFilterScreenLocations = <String>[
    "Enugu, Nigeria",
    "Independence layout",
    "Lagos, Nigeria",
    "Delta, Nigeria",
  ];

  var selectedLocation = "Select a location".obs;

  void setSelectedLocation(String? location) {
    if (location != null) {
      selectedLocation.value = location;
      log("Selected Location: ${selectedLocation.value}");
    }
  }

//=========== Property categories ===============\\
  var propertyType = [
    PropertyCategoryModel(name: "All", isSelected: true),
    PropertyCategoryModel(name: "Apartments/Flats", isSelected: false),
    PropertyCategoryModel(name: "Lands", isSelected: false),
    PropertyCategoryModel(name: "Workspace", isSelected: false),
    PropertyCategoryModel(name: "Shortlets", isSelected: false),
    PropertyCategoryModel(name: "Commercial Properties", isSelected: false),
  ].obs;

  void selectPropertyType(int index) {
    for (int i = 0; i < propertyType.length; i++) {
      propertyType[i].isSelected = i == index;
    }
    update();
  }

//=========== Advert categories =================\\

  var searchFilterScreenAdvertCategories = <String>[
    "Sale",
    "Lease",
    "Sublet",
    "Rent",
  ];

  var selectedAdvertCategory = "Select a category".obs;

  void setSelectedadvertCategory(String? advert) {
    if (advert != null) {
      selectedAdvertCategory.value = advert;
      log("Selected advert: ${selectedAdvertCategory.value}");
    }
  }

//=========== Number of Bedrooms =================\\
}
