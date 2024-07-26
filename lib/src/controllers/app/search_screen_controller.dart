import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  //================ Focus Nodes =================\\

  var searchFN = FocusNode();

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
}
