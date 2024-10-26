import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/models/user/user_model.dart';

import '../../../main.dart';
import '../../models/user/user_signup_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  var userModel = UserModel.fromJson(null).obs;
  var isLoading = false.obs;

  Future<void> getUserProfile() async {
    isLoading.value = true;

    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.profile;
    var userToken = prefs.getString("userToken");
    // log("This is the user token: $userToken");

    //HTTP Client Service
    http.Response? response =
        await HttpClientService.getRequest(url, userToken);

    // //Dio Client Service
    // var response = await DioClientService.getRequest(
    //   url,
    //   token: userToken,
    // );

    if (response == null) {
      isLoading.value = false;
      log("The response is null");
      return;
    }

    try {
      // Convert to json
      var responseJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // log("This is the user model ====> $responseJson");
        userModel.value = UserModel.fromJson(responseJson);
        log("This is the user model ====> ${jsonEncode(userModel.value)}");
      } else {
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
  }

  // Save user data to SharedPreferences as a JSON string
  static Future<void> saveUserSignupDataToPreferences(
      UserSignupDataModel user) async {
    // Convert UserSignupDataModel to JSON string

    String userJson = jsonEncode(user.toJson());

    // log("This is the user signup data model:$userJson");

    // Save the JSON string to shared preferences
    await prefs.setString('user', userJson);
  }

  // Load user data from SharedPreferences and convert it back to UserSignupDataModel
  static Future<void> loadUserSignupDataToPreferences() async {
    var userModel = UserSignupDataModel.fromJson(null).obs;

    // Retrieve the JSON string from shared preferences
    String? userJson = prefs.getString('user') ?? "";

    // Convert JSON string back to a map
    Map<String, dynamic> userMap = jsonDecode(userJson);

    // Convert the map to a UserSignupDataModel and update the observable
    userModel.value = UserSignupDataModel.fromJson(userMap);

    log("This is the user signup data model:${userModel.value}");
  }

  // Example method to update the user model (e.g., after an API call)
  static void updateUserSignupData(UserSignupDataModel user) {
    var userModel = UserSignupDataModel.fromJson(null).obs;

    // Update the observable UserSignupDataModel
    userModel.value = user;

    log("This is the updated user signup data: $user");

    // Save the updated user to shared preferences
    saveUserSignupDataToPreferences(user);
  }

  static void deleteUserSignupData() {
    var userModel = UserSignupDataModel.fromJson(null).obs;

    // Save the updated user to shared preferences
    updateUserSignupData(userModel.value);
  }
}
