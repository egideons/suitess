import 'package:get/get.dart';
import 'package:kribb/app/onboarding/screens/onboarding.dart';
import 'package:kribb/app/splash/screens/startup_splash.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";

  //Onboarding
  static const onboarding = "/onboarding";

  //Auth Screens
  static const signup = "/signup";
  static const login = "/login";
  static const forgotPassword = "/forgot-password";
  static const otp = "/otp";
  static const resetPassword = "/reset-password";

  //Get Pages
  static final getPages = [
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: onboarding, page: () => const Onboarding()),
  ];
}
