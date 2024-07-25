import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../../main.dart';
import '../others/loading_controller.dart';

class ProfileScreenController extends GetxController {
  static ProfileScreenController get instance {
    return Get.find<ProfileScreenController>();
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

//================ Logout================\\
  logout() async {
    prefs.setBool("isLoggedIn", false);
    prefs.setBool("isLoggedOut", true);

    await Get.offAll(
      () => LoadingScreen(
        loadData: LoadingController.instance.logout,
      ),
      routeName: "/loading-screen",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  //=================  ===================//
}
