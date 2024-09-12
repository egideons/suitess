import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LandLordAddPropertyController extends GetxController {
  static LandLordAddPropertyController get instance {
    return Get.find<LandLordAddPropertyController>();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ Keys =================\\
  final formKey = GlobalKey<FormState>();

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;
  var isNoticePageVisible = true.obs;

  //================ Variables =================\\

  //================ controllers =================\\

  var scrollController = ScrollController();

//================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );

//================ Scroll Listener =================//

  void scrollListener() {
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

//================ Remove notice =================//
  removeNotice() async {
    scrollToTop();
    isNoticePageVisible.value = false;
    update();
  }
}
