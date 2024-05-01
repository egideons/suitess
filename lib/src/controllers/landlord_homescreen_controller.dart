import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LandlordHomescreenController extends GetxController {
  static LandlordHomescreenController get instance {
    return Get.find<LandlordHomescreenController>();
  }

  //================ variables =================\\
  var isLoading = false.obs;
  var hasProperties = false.obs;
  var isKYCVerified = false.obs;
  var availableAgentsIsVisible = false.obs;

  //================ controllers =================\\

  var scrollController = ScrollController();
  var searchController = TextEditingController();

  //================ functions =================\\
  showAvailableAgents() {
    availableAgentsIsVisible.value = true;
    update();
    log("Agents are availble: ${availableAgentsIsVisible.value}");
  }

  hideAvailableAgents() {
    availableAgentsIsVisible.value = false;
    update();
    log("Agents are availble: ${availableAgentsIsVisible.value}");
  }

  Future<void> onRefresh() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    update();
  }
}
