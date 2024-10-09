import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PrivacyAndSecurityController extends GetxController {
  static PrivacyAndSecurityController get instance {
    return Get.find<PrivacyAndSecurityController>();
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
  var profileIsPublic = false.obs;
  var profileIsPrivate = true.obs;
  var listedPropertiesIsPublic = true.obs;
  var listedPropertiesIsPrivate = false.obs;
  var activityStatusIsPublic = true.obs;
  var activityStatusIsPrivate = false.obs;
  var clientInteractionIsPublic = true.obs;
  var clientInteractionIsPrivate = false.obs;
  var thirdPartySharingIsEnabled = false.obs;

  //================ controllers =================\\

  var scrollController = ScrollController();
  var searchController = TextEditingController();

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

//================ Profile Visibility Functions ================\\
  void selectPublicProfileVisisbility() {
    profileIsPublic.value = true;
    profileIsPrivate.value = false;
    Get.close(0);
    update();
  }

  void selectPrivateProfileVisibility() {
    profileIsPublic.value = false;
    profileIsPrivate.value = true;
    Get.close(0);
    update();
  }

//================ Listed Properties Visibility Functions ================\\
  void selectPublicListedPropertiesVisibility() {
    listedPropertiesIsPublic.value = true;
    listedPropertiesIsPrivate.value = false;
    Get.close(0);
    update();
  }

  void selectPrivateListedPropertiesVisibility() {
    listedPropertiesIsPublic.value = false;
    listedPropertiesIsPrivate.value = true;
    Get.close(0);
    update();
  }

//================ Activity Status Visibility Functions ================\\
  void selectPublicActivityStatusVisibility() {
    activityStatusIsPublic.value = true;
    activityStatusIsPrivate.value = false;
    Get.close(0);
    update();
  }

  void selectPrivateActivityStatusVisibility() {
    activityStatusIsPublic.value = false;
    activityStatusIsPrivate.value = true;
    Get.close(0);
    update();
  }

//================ Client Interaction Visibility Functions ================\\
  void selectPublicClientInteractionVisibility() {
    clientInteractionIsPublic.value = true;
    clientInteractionIsPrivate.value = false;
    Get.close(0);
    update();
  }

  void selectPrivateClientInteractionVisibility() {
    clientInteractionIsPrivate.value = true;
    clientInteractionIsPublic.value = false;
    Get.close(0);
    update();
  }

//================ Toggle Third Party Sharing ================\\
  toggleThirdPartySharing(value) {
    thirdPartySharingIsEnabled.value = value;
    update();
  }
}
