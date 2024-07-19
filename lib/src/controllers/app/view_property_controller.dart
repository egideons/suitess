import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../models/property_category_model.dart';
import '../../routes/routes.dart';

class ViewPropertyController extends GetxController {
  static ViewPropertyController get instance {
    return Get.find<ViewPropertyController>();
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

  //================ controllers =================\\

  var scrollController = ScrollController();
  var imageController = PageController().obs;

  //================ Booleans =================\\
  var isRefreshing = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var bidDetailsIsVisible = false.obs;

  //================ Variables =================\\
  var propertyCarouselImages = <String>[
    Assets.indoorKitchenPng,
    Assets.indoorKitchenPng,
    Assets.indoorKitchenPng,
  ];
  var propertyImages = <String>[
    Assets.indoorSittingRoomPng,
    Assets.indoorBedroomPng,
    Assets.indoorKitchen2Png,
  ];
  var propertyTabs = [
    PropertyCategoryModel(name: "About", isSelected: true),
    PropertyCategoryModel(name: "Agent", isSelected: false),
  ].obs;

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

//================ Select Tab =================//
  void selectTab(int index) {
    for (int i = 0; i < propertyTabs.length; i++) {
      propertyTabs[i].isSelected = i == index;
    }
    update();
  }

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

//================ Show and Hide bid details =================//

  viewDetailsOfNewBids() {
    bidDetailsIsVisible.value = true;
    update();
    log("Bid details are visible: ${bidDetailsIsVisible.value}");
  }

  hideDetailsOfNewBids() {
    bidDetailsIsVisible.value = false;
    update();
    log("Bid details are visible: ${bidDetailsIsVisible.value}");
  }

//================ Navigation =================//
  toBidDetailsScreen() async {
    await Get.toNamed(Routes.bidDetails, preventDuplicates: true);
  }
}
