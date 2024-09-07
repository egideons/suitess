import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../models/user/user_signup_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  // Save user data to SharedPreferences as a JSON string
  static Future<void> saveUserToPreferences(UserSignupDataModel user) async {
    // Convert UserSignupDataModel to JSON string

    String userJson = jsonEncode(user.toJson());

    log("This is the user signup data model:$userJson");

    // Save the JSON string to shared preferences
    await prefs.setString('user', userJson);
  }

  // Load user data from SharedPreferences and convert it back to UserSignupDataModel
  static Future<void> loadUserFromPreferences() async {
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
  static void updateUser(UserSignupDataModel user) {
    var userModel = UserSignupDataModel.fromJson(null).obs;

    userModel.value = user; // Update the observable UserSignupDataModel
    saveUserToPreferences(user); // Save the updated user to shared preferences
  }
}
