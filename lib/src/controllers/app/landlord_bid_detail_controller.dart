import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BidDetailsController extends GetxController {
  static BidDetailsController get instance {
    return Get.find<BidDetailsController>();
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

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;
  var bidIsNull = true.obs;
  var bidIsAccepted = false.obs;
  var isAccepting = false.obs;
  var isDeclining = false.obs;

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

  //================ Accept and Decline bid =================//

  acceptBid() async {
    isAccepting.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    bidIsAccepted.value = true;
    bidIsNull.value = false;
    update();

    log("Bid details is accepted: ${bidIsAccepted.value}");
    isAccepting.value = false;
    update();
  }

  declineBid() async {
    isDeclining.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    bidIsAccepted.value = false;
    bidIsNull.value = false;
    update();

    log("Bid details is accepted: ${bidIsAccepted.value}");
    isDeclining.value = false;
    update();
  }
}
