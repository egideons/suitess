import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationsSettingsController extends GetxController {
  static NotificationsSettingsController get instance {
    return Get.find<NotificationsSettingsController>();
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
  var enableGeneralNotif = true.obs;
  var enableSound = false.obs;
  var enableVibrate = true.obs;
  var enableNewHouseListingNotif = true.obs;
  var enableNearbyHousesNotif = false.obs;
  var enableAppUpdatesNotif = false.obs;
  var enableBillReminderNotif = true.obs;
  var enablePromotionNotif = true.obs;
  var enableDiscountAvailableNotif = false.obs;
  var enableNewServiceAvailableNotif = false.obs;
  var enableNewTipsAvailableNotif = true.obs;

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

//================ Toggle Functions ================\\
  toggleGeneralNotif(value) {
    enableGeneralNotif.value = value;
    update();
  }

  toggleSound(value) {
    enableSound.value = value;
    update();
  }

  toggleVibrate(value) {
    enableVibrate.value = value;
    update();
  }

  toggleNewHouseListing(value) {
    enableNewHouseListingNotif.value = value;
    update();
  }

  toggleNearbyHouses(value) {
    enableNearbyHousesNotif.value = value;
    update();
  }

  toggleAppUpdates(value) {
    enableAppUpdatesNotif.value = value;
    update();
  }

  toggleBillReminder(value) {
    enableBillReminderNotif.value = value;
    update();
  }

  togglePromotion(value) {
    enablePromotionNotif.value = value;
    update();
  }

  toggleDiscountAvailable(value) {
    enableDiscountAvailableNotif.value = value;
    update();
  }

  toggleNewServiceAvailable(value) {
    enableNewServiceAvailableNotif.value = value;
    update();
  }

  toggleNewTipsAvailable(value) {
    enableNewTipsAvailableNotif.value = value;
    update();
  }

  //=================  ===================//
}
