import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/profile/content/select_profile_pic_modal.dart';

import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../../main.dart';
import '../auth/user_controller.dart';
import '../others/loading_controller.dart';

class ProfileScreenController extends GetxController {
  static ProfileScreenController get instance {
    return Get.find<ProfileScreenController>();
  }

  @override
  void onInit() {
    super.onInit();
    UserController.instance.getUserProfile();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var isLoading = false.obs;
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

//================ Upload Profile Picture ==================\\
  showUploadProfilePicModal() {
    var media = MediaQuery.of(Get.context!).size;
    var colorScheme = Theme.of(Get.context!).colorScheme;

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      barrierColor: colorScheme.inversePrimary.withOpacity(.4),
      constraints:
          BoxConstraints(maxHeight: media.height / 2, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const SelectProfilePicModal(),
        );
      },
    );
  }

//================ Logout ================\\
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
