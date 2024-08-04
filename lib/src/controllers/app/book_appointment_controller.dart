import 'package:flutter/material.dart';
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
    generateTimeOfDayList();
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
  var timeOfDayList = <TimeOfDayModel>[].obs;

  void generateTimeOfDayList() {
    TimeOfDay startTime = const TimeOfDay(hour: 8, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 18, minute: 0);

    while (startTime.hour < endTime.hour ||
        (startTime.hour == endTime.hour &&
            startTime.minute <= endTime.minute)) {
      timeOfDayList.add(TimeOfDayModel(
          time: timeOfDayToString(startTime), isSelected: false));
      startTime = addMinutesToTimeOfDay(startTime, 30);
    }

    // Optionally, set the first time as selected by default
    if (timeOfDayList.isNotEmpty) {
      timeOfDayList[0].isSelected = true;
    }
  }

  TimeOfDay addMinutesToTimeOfDay(TimeOfDay time, int minutes) {
    final int newMinutes = time.minute + minutes;
    final int hoursToAdd = newMinutes ~/ 60;
    final int remainingMinutes = newMinutes % 60;

    return TimeOfDay(
      hour: (time.hour + hoursToAdd) % 24,
      minute: remainingMinutes,
    );
  }

  String timeOfDayToString(TimeOfDay time) {
    final String hour = time.hourOfPeriod < 10
        ? '0${time.hourOfPeriod}'
        : '${time.hourOfPeriod}';
    final String minute =
        time.minute < 10 ? '0${time.minute}' : '${time.minute}';
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  void selectTimeOfDay(int index) {
    for (int i = 0; i < timeOfDayList.length; i++) {
      timeOfDayList[i].isSelected = i == index;
    }
    update();
  }
}
