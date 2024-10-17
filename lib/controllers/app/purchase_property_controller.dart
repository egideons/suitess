import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/screens/property/checkout_property/screen/android_checkout_property_screen.dart';

class PurchasePropertyController extends GetxController {
  static PurchasePropertyController get instance {
    return Get.find<PurchasePropertyController>();
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

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  //============= Payment Method ================\\

  payWithWallet() async {
    await Get.to(
      () => const AndroidCheckoutPropertyScreen(androidPaymentMethod: "Wallet"),
      routeName: "/checkout-property",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  payWithATMCard() async {
    await Get.to(
      () =>
          const AndroidCheckoutPropertyScreen(androidPaymentMethod: "ATM Card"),
      routeName: "/checkout-property",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  payWithBankTransfer() async {
    await Get.to(
      () => const AndroidCheckoutPropertyScreen(
          androidPaymentMethod: "Bank Transfer"),
      routeName: "/checkout-property",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
