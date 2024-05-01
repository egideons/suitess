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

  //================ controllers =================\\

  var scrollController = ScrollController();
  var searchController = TextEditingController();

  //================ functions =================\\
  Future<void> onRefresh() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    update();
  }
}
