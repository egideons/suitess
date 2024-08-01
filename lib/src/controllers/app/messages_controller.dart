import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/screens/chat/screen/chat_screen.dart';

class MessagesController extends GetxController {
  static MessagesController get instance {
    return Get.find<MessagesController>();
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
  var userName = "Francis Acoi";
  var lastMsg =
      "Hi! Thanks for your time. I'm looking for a 3-bedroom house in a family-friendly neighborhood.";

  //================ controllers =================\\

  var scrollController = ScrollController();

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

  //================ Navigation =================//

  goToChat() async {
    await Get.to(
      () => ChatScreen(userName: userName),
      routeName: "/chat",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Transition.rightToLeft,
    );
  }
}
