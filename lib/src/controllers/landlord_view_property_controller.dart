import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';

import '../constants/assets.dart';

class LandLordViewPropertyController extends GetxController {
  static LandLordViewPropertyController get instance {
    return Get.find<LandLordViewPropertyController>();
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
  var isScrollToTopBtnVisible = false.obs;
  var listBanners = [
    BannerModel(imagePath: Assets.kitchen, id: "${createUniqueId()}"),
    BannerModel(imagePath: Assets.buildings, id: "${createUniqueId()}"),
    BannerModel(imagePath: Assets.buildings, id: "${createUniqueId()}"),
    BannerModel(imagePath: Assets.kitchen, id: "${createUniqueId()}"),
  ];

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
    if (scrollController.position.pixels >= 100) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 100) {
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
