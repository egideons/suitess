import 'package:get/get.dart';
import 'package:kribb/app/splash/screens/startup_splash.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";

  //Get Pages
  static final getPages = [
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
  ];
}
