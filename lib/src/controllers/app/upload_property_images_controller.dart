import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UploadPropertyImagesController extends GetxController {
  static UploadPropertyImagesController get instance {
    return Get.find<UploadPropertyImagesController>();
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
  var isScrollToTopBtnVisible = false.obs;
  var isLoading = false.obs;
  var responseMessage = "".obs;

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
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
    }
  }

  Future<void> publish() async {
    isLoading.value = true;

    //HTTP Client Service
    // http.Response? response =
    //     await HttpClientService.postRequest(url, userToken, data);

    // if (response == null) {
    //   isLoading.value = false;
    //   return;
    // }

    //   try {
    //     var responseJson = jsonDecode(response.body);

    //     log("This is the response body ====> ${response.body}");

    //     responseMessage.value = responseJson["message"];

    //     //Map the response json to the model provided
    //     // addPropertyResponse.value = addPropertyResponseModel.fromJson(responseJson);
    //     // responseMessage.value = addPropertyResponse.value.message;

    //     if (response.statusCode == 200) {
    //       //Display Snackbar
    //       ApiProcessorController.successSnack("Successful");
    //     } else {
    //       ApiProcessorController.warningSnack(responseMessage.value);
    //       log("Request failed with status: ${response.statusCode}");
    //       log("Response body: ${response.body}");
    //     }
    //   } catch (e) {
    //     log(e.toString());
    //   }
    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
    // }
  }
}
