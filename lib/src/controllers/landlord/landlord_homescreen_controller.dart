import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LandlordHomescreenController extends GetxController {
  static LandlordHomescreenController get instance {
    return Get.find<LandlordHomescreenController>();
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
