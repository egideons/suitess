import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SupportAndFeedbackController extends GetxController {
  static SupportAndFeedbackController get instance {
    return Get.find<SupportAndFeedbackController>();
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
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

//================ Expand Profile Visibility Functions ================\\

//================ Expand Listed Properties Functions ================\\

//================ Expand Activity Status Functions ================\\
}
