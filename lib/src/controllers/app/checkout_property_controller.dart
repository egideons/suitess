import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/property/checkout_property/content/checkout_property_congratulations_modal_sheet.dart';
import '../../../app/screens/property/checkout_property/content/schedule_move_in_congratulations_modal_sheet.dart';
import '../../../app/screens/property/checkout_property/content/schedule_move_in_modal_sheet.dart';
import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../models/time_appointment_model.dart';
import '../others/loading_controller.dart';

class CheckoutPropertyController extends GetxController {
  static CheckoutPropertyController get instance {
    return Get.find<CheckoutPropertyController>();
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
  //================ Modal Bottom Sheets ================\\

  showCongratulationsModalSheet(BuildContext context, Size media) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const CheckoutPropertyCongratulationsModalSheet(),
        );
      },
    );
  }

  showScheduleMoveInModalSheet(BuildContext context, Size media) async {
    Get.close(0);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const ScheduleMoveInModalSheet(),
        );
      },
    );
  }

  showScheduleMoveInCongratulationsModalSheet(
      BuildContext context, Size media) async {
    Get.close(0);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const ScheduleMoveInCongratulationsModalSheet(),
        );
      },
    );
  }

  //=========== Time Appointment Categories ===============\\
  var timeOfDayList = <TimeOfDayModel>[].obs;
  var selectedDay = DateTime.now();

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

  //====================== Calendar Functions =======================\\
  void onDaySelected(DateTime day, DateTime focusedDay) async {
    selectedDay = day;
    log("Selected day ======> ${selectedDay.toString().split(" ")[0]}");
    update();
  }

  //====================== Go Home =======================\\
  goHome() async {
    await Get.offAll(
      () => LoadingScreen(
        loadData: LoadingController.instance.loadBottomNavgiationView,
      ),
      routeName: "/bottom-navigation-view",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
