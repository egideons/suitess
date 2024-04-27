import 'package:get/get.dart';
import 'package:kribb/app/auth/forgot_password/screen/forgot_password.dart';
import 'package:kribb/app/auth/signup/screen/signup.dart';
import 'package:kribb/app/choose_experience/screen/choose_experience.dart';
import 'package:kribb/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:kribb/app/kyc/kyc_profile_photo/screen/kyc_profile_photo.dart';
import 'package:kribb/app/onboarding/screen/onboarding.dart';
import 'package:kribb/app/splash/startup/screens/startup_splash.dart';

import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/login/screen/login.dart';
import '../../app/auth/reset_password/screen/reset_password.dart';
import '../../app/kyc/kyc_bvn/screen/kyc_bvn.dart';
import '../../app/kyc/kyc_bvn_otp/screen/kyc_bvn_otp.dart';
import '../../app/kyc/kyc_nin/screen/kyc_nin.dart';
import '../../app/splash/congratulations/screen/congratulations_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const congratulationsSplashScreen = "/congratulations-splash-screen";
  static const successSplashScreen = "/success-splash-screen";

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
  static const kycBvn = "/kyc-bvn";
  static const kycBvnOTP = "/kyc-bvn-otp";
  static const kycNin = "/kyc-nin";
  static const kyProfilePhoto = "/kyc-profile-photo";

  //Choose Experience
  static const chooseExperience = "/choose-experience";

  //Get Pages
  static final getPages = [
    //Splash Screens
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(
      name: congratulationsSplashScreen,
      page: () => const CongratulationsSplashScreen(),
    ),
    // GetPage(name: successSplashScreen, page: () => const SuccesssSplashscreen()),

    //Auth Pages
    GetPage(name: onboarding, page: () => const Onboarding()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: emailOTP, page: () => const EmailOTP()),
    GetPage(name: forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: resetPassword, page: () => const ResetPassword()),

    //KYC Pages
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
    GetPage(name: kycBvn, page: () => const KycBvn()),
    GetPage(name: kycBvnOTP, page: () => const KycBvnOTP()),
    GetPage(name: kycNin, page: () => const KycNIN()),
    GetPage(name: kyProfilePhoto, page: () => const KycProfilePhoto()),

    //Choose Experience
    GetPage(name: chooseExperience, page: () => const ChooseExperience()),
  ];
}
