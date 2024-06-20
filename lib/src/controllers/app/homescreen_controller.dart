import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/property_category_model.dart';

class HomescreenController extends GetxController {
  static HomescreenController get instance {
    return Get.find<HomescreenController>();
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
  var isRefreshing = false.obs;
  var hasProperties = false.obs;
  var isKYCVerified = false.obs;
  var availableAgentsIsVisible = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var propertyCategories = [
    PropertyCategoryModel(name: "Apartments/Flats", isSelected: true),
    PropertyCategoryModel(name: "Lands", isSelected: false),
    PropertyCategoryModel(name: "Shortlets", isSelected: false),
    PropertyCategoryModel(name: "Commercial Properties", isSelected: false),
  ].obs;

  //================ controllers =================\\

  var scrollController = ScrollController();
  var searchController = TextEditingController();

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

  //================ Show and Hide Available Agents =================//

  goToBids() {}

  void selectPropertyCategory(int index) {
    for (int i = 0; i < propertyCategories.length; i++) {
      propertyCategories[i].isSelected = i == index;
    }
    update();
  }

  showAvailableAgents() {
    availableAgentsIsVisible.value = true;
    update();
    log("Available agents are visible: ${availableAgentsIsVisible.value}");
  }

  hideAvailableAgents() {
    availableAgentsIsVisible.value = false;
    update();
    log("Available agents are visible: ${availableAgentsIsVisible.value}");
  }
}
