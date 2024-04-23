import 'package:get/get.dart';
import 'package:kribb/app/auth/signup/screen/signup.dart';
import 'package:kribb/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:kribb/app/onboarding/screen/onboarding.dart';
import 'package:kribb/app/splash/screens/startup_splash.dart';

import '../../app/auth/bvn/screen/bvn.dart';
import '../../app/auth/bvn_otp/screen/bvn_otp.dart';
import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/login/screen/login.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";

  //Onboarding
  static const onboarding = "/onboarding";

  //Auth Screens
  static const signup = "/signup";
  static const login = "/login";
  static const emailOTP = "/email-otp";
  static const forgotPassword = "/forgot-password";
  static const resetPassword = "/reset-password";
  static const changePassword = "/change-password";

  //KYC Screens
  static const kycAddLocation = "/kyc-add-location";
  static const bvn = "/bvn";
  static const bvnOTP = "/bvn-otp";

  //Get Pages
  static final getPages = [
    //Auth Pages
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: onboarding, page: () => const Onboarding()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: emailOTP, page: () => const EmailOTP()),

    //KYC Pages
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
    GetPage(name: bvn, page: () => const Bvn()),
    GetPage(name: bvnOTP, page: () => const BvnOTP()),
  ];
}
