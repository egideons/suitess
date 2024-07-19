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
  var propertyImages = <String>[
    Assets.indoorKitchenPng,
    Assets.indoorKitchenPng,
    Assets.indoorKitchenPng,
  ];
  var propertyTabs = [
    PropertyCategoryModel(name: "About", isSelected: true),
    PropertyCategoryModel(name: "Agent", isSelected: false),
  ].obs;

  customBanners(media, {numberOfBanners}) => List.generate(
        numberOfBanners ?? 1,
        (index) => Container(
          // width: media.width,
          // height: media.height * .18,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.buildings),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

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