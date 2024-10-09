import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/user_controller.dart';

class MyBusinessController extends GetxController {
  static MyBusinessController get instance {
    return Get.find<MyBusinessController>();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UserController.instance.getUserProfile();
    });
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var isScrollToTopBtnVisible = false.obs;

  //================ controllers =================\\
  var scrollController = ScrollController();

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

  //=================  ===================//
}
