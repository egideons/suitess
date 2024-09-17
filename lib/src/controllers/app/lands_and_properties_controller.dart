import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/main.dart';

import '../auth/user_controller.dart';

class LandsAndPropertiesController extends GetxController {
  static LandsAndPropertiesController get instance {
    return Get.find<LandsAndPropertiesController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UserController.instance.getUserProfile();
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var isScrollToTopBtnVisible = false.obs;
  var isRefreshing = false.obs;
  var hasProperties = false.obs;
  var hasNotifications = true.obs;
  var businessName = prefs.getString("businessName") ?? "";
  var verifyAccountBannerIsVisible = true.obs;

  //================ controllers =================\\

  var scrollController = ScrollController();

  //================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await UserController.instance.getUserProfile();

    isRefreshing.value = false;
    update();
  }

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

  void verifyAccount() {}

  void removeVerifyAccountBanner() {
    verifyAccountBannerIsVisible.value = false;
  }

  addProperty() async {}
}
