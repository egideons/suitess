import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/splash/loading/screen/loading_screen.dart';

import '../others/loading_controller.dart';

class SuccessScreenController extends GetxController {
  static SuccessScreenController get instance {
    return Get.find<SuccessScreenController>();
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

//================ Navigation =================//

  goHome() async {
    await Get.offAll(
      () => LoadingScreen(
        loadData: LoadingController.instance.loadBottomNavgiationView,
      ),
      routeName: "/bottom-navigation-view",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  goToWalletTab() async {
    await Get.offAll(
      () => LoadingScreen(
        loadData: LoadingController.instance.loadWalletTab,
      ),
      routeName: "/bottom-navigation-view",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
