import 'package:get/get.dart';
import 'package:kribb/app/onboarding/screens/onboarding.dart';
import 'package:kribb/app/splash/screens/startup_splash.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";

  //Onboarding
  static const onboarding = "/onboarding";

  //Get Pages
  static final getPages = [
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: onboarding, page: () => const Onboarding()),
  ];
}
