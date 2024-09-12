import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:suitess/app/screens/profile/content/select_profile_pic_modal.dart';

import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../../main.dart';
import '../../constants/consts.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';
import '../auth/user_controller.dart';
import '../others/api_processor_controller.dart';
import '../others/loading_controller.dart';

class ProfileScreenController extends GetxController {
  static ProfileScreenController get instance {
    return Get.find<ProfileScreenController>();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UserController.instance.getUserProfile();
    });
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var isUploadingProfilePic = false.obs;
  var profilePicIsUploaded = false.obs;
  var hasProperties = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var cameraPermissionIsGranted = false.obs;

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

//================ Upload Profile Picture ==================\\
  final ImagePicker picker = ImagePicker();
  XFile? selectedProfileImage;

  showUploadProfilePicModal() {
    var media = MediaQuery.of(Get.context!).size;

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
      constraints:
          BoxConstraints(maxHeight: media.height / 3.2, maxWidth: media.width),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const SelectProfilePicModal(),
        );
      },
    );
  }

  requestCameraPermission() async {
    try {
      log('Requesting camera permission');
      var status = await Permission.camera.request();
      log('Permission status: $status');

      if (status.isGranted) {
        cameraPermissionIsGranted.value = true;
        Get.close(0);
        uploadProfilePicWithCamera();
      } else if (status.isDenied) {
        await Permission.camera.request();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } catch (e) {
      log('Error while requesting camera permission: $e');
    }
  }

  requestGalleryPermission() async {
    try {
      log('Requesting media library permission');
      var status = await Permission.mediaLibrary.request();
      log('Permission status: $status');

      if (status.isGranted) {
        cameraPermissionIsGranted.value = true;
        Get.close(0);
        uploadProfilePicWithGallery();
      } else if (status.isDenied) {
        await Permission.mediaLibrary.request();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } catch (e) {
      log('Error while requesting media library permission: $e');
    }
  }

  uploadProfilePicWithCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedProfileImage = image;
      update();
    }
  }

  uploadProfilePicWithGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedProfileImage = image;
      update();
    }
  }

  Future<void> uploadProfilePic() async {
    if (selectedProfileImage == null) {
      ApiProcessorController.errorSnack("No image selected");
      return;
    }
    if (await checkXFileSize(selectedProfileImage)) {
      ApiProcessorController.errorSnack("Image size must not exceed 5mb");
      return;
    }

    isUploadingProfilePic.value = true;

    // URL and token for the request
    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.profile;
    var userToken = prefs.getString("userToken") ?? "";

    //HTTP Client Service
    var streamedResponse = await HttpClientService.putRequestWithFile(
      url,
      userToken,
      selectedProfileImage!,
    );

    if (streamedResponse == null) {
      isUploadingProfilePic.value = false;
      ApiProcessorController.errorSnack("Failed to upload profile picture");
      return;
    }

    // Convert the streamed response to a regular response to read the body
    var response = await http.Response.fromStream(streamedResponse);

    // Log the status code and response body
    log("Response status code: ${response.statusCode}");
    log("Response body: ${response.body}");

    if (response.statusCode == 200) {
      profilePicIsUploaded.value = true;
      ApiProcessorController.successSnack(
        "Profile picture uploaded successfully",
      );
      await UserController.instance.getUserProfile();
    } else {
      ApiProcessorController.errorSnack("Failed to upload profile picture");
    }

    isUploadingProfilePic.value = false;
  }

//================ Logout ================\\
  logout() async {
    prefs.setBool("isLoggedIn", false);
    prefs.setBool("isLoggedOut", true);

    await Get.offAll(
      () => LoadingScreen(
        loadData: LoadingController.instance.logout,
      ),
      routeName: "/loading-screen",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  //=================  ===================//
}
