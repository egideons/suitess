import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/time_appointment_model.dart';

class BookAppointmentController extends GetxController {
  static BookAppointmentController get instance {
    return Get.find<BookAppointmentController>();
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

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  //=========== Time Appointment Categories ===============\\
  var timeOfDay = [
    TimeOfDayModel(time: "", isSelected: true),
    TimeOfDayModel(time: "", isSelected: false),
    TimeOfDayModel(time: "", isSelected: false),
    TimeOfDayModel(time: "", isSelected: false),
    TimeOfDayModel(time: "", isSelected: false),
    TimeOfDayModel(time: "", isSelected: false),
  ].obs;

  void selectPropertyType(int index) {
    for (int i = 0; i < timeOfDay.length; i++) {
      timeOfDay[i].isSelected = i == index;
    }
    update();
  }
}
