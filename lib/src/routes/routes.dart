import 'package:get/get.dart';
import 'package:kribb/app/auth/forgot_password/screen/forgot_password.dart';
import 'package:kribb/app/auth/signup/screen/signup.dart';
import 'package:kribb/app/choose_experience/screen/choose_experience.dart';
import 'package:kribb/app/experience/landlord/home/screen/landlord_home_screen.dart';
import 'package:kribb/app/experience/landlord/notifications/screen/landlord_notifiactions.dart';
import 'package:kribb/app/experience/landlord/view/screen/landlord_navigation_overview.dart';
import 'package:kribb/app/experience/landlord/property/view_property/screen/landlord_view_property.dart';
import 'package:kribb/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:kribb/app/kyc/kyc_profile_photo/screen/kyc_profile_photo.dart';
import 'package:kribb/app/onboarding/screen/onboarding.dart';
import 'package:kribb/app/splash/startup/screen/startup_splash.dart';

import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/forgot_password_otp/via_email/screen/forgot_password_via_email_otp.dart';
import '../../app/auth/forgot_password_otp/via_sms/screen/forgot_password_via_sms.dart';
import '../../app/auth/login/screen/login.dart';
import '../../app/auth/reset_password/screen/reset_password.dart';
import '../../app/experience/landlord/bid_details/screen/landlord_bid_details.dart';
import '../../app/kyc/kyc_bvn/screen/kyc_bvn.dart';
import '../../app/kyc/kyc_bvn_otp/screen/kyc_bvn_otp.dart';
import '../../app/kyc/kyc_nin/screen/kyc_nin.dart';
import '../../app/splash/congratulations/screen/congratulations_screen.dart';
import '../../app/splash/loading/screen/loading_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const congratulationsSplashScreen = "/congratulations-splash-screen";
  static const successSplashScreen = "/success-splash-screen";
  static const loadingScreen = "/loading-screen";

  //Onboarding
  static const onboarding = "/onboarding";

  //Locked Screen
  static const lockedScreen = "/lockedScreen";

  //Auth Screens
  static const signup = "/signup";
  static const login = "/login";
  static const emailOTP = "/email-otp";
  static const forgotPassword = "/forgot-password";
  static const resetPassword = "/reset-password";
  static const changePassword = "/change-password";
  static const forgotPasswordViaEmailOTP = "/forgot-password-via-email-otp";
  static const forgotPasswordViaSmsOTP = "/forgot-password-via-sms-otp";

  //KYC Screens
  static const kycAddLocation = "/kyc-add-location";
  static const kycBvn = "/kyc-bvn";
  static const kycBvnOTP = "/kyc-bvn-otp";
  static const kycNin = "/kyc-nin";
  static const kyProfilePhoto = "/kyc-profile-photo";
  static const chooseExperience = "/choose-experience";

  //Landlord Section
  static const landLordOverview = "/landlord-navigation-overview";
  static const landLordHomeScreen = "/landlord-homescreen";
  static const landLordWallet = "/landlord-wallet";
  static const landLordChat = "/landlord-chat";
  static const landLordProfile = "/landlord-profile";
  static const landLordNotifications = "/landlord-notifications";
  static const landLordViewProperty = "/landlord-view-property";
  static const landLordBidDetails = "/landlord-bid-details";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Splash Screens
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(
      name: congratulationsSplashScreen,
      page: () => const CongratulationsSplashScreen(),
    ),
    // GetPage(name: successSplashScreen, page: () => const SuccesssSplashscreen()),
    GetPage(name: loadingScreen, page: () => const LoadingScreen()),

    //Auth Pages
    GetPage(name: onboarding, page: () => const Onboarding()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: emailOTP, page: () => const EmailOTP()),
    GetPage(name: forgotPassword, page: () => const ForgotPassword()),
    GetPage(
      name: forgotPasswordViaEmailOTP,
      page: () => const ForgotPasswordViaEmailOTP(),
    ),
    GetPage(
      name: forgotPasswordViaSmsOTP,
      page: () => const ForgotPasswordViaSMSOTP(),
    ),
    GetPage(name: resetPassword, page: () => const ResetPassword()),

    //KYC Pages
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
    GetPage(name: kycBvn, page: () => const KycBvn()),
    GetPage(name: kycBvnOTP, page: () => const KycBvnOTP()),
    GetPage(name: kycNin, page: () => const KycNIN()),
    GetPage(name: kyProfilePhoto, page: () => const KycProfilePhoto()),
    GetPage(name: chooseExperience, page: () => const ChooseExperience()),

    //LandLord Section
    GetPage(
      name: landLordOverview,
      page: () => const LandLordNavigationOverView(),
    ),
    GetPage(
      name: landLordHomeScreen,
      page: () => const LandLordHomeScreen(),
    ),
    // GetPage(
    //   name: landLordWallet,
    //   page: () => const LandLordNavigationOverView(),
    // ),
    // GetPage(
    //   name: landLordChat,
    //   page: () => const LandLordNavigationOverView(),
    // ),
    // GetPage(
    //   name: landLordProfile,
    //   page: () => const LandLordNavigationOverView(),
    // ),
    GetPage(
      name: landLordNotifications,
      page: () => const LandLordNotifications(),
    ),
    GetPage(
      name: landLordViewProperty,
      page: () => const LandLordViewProperty(),
    ),
    GetPage(
      name: landLordBidDetails,
      page: () => const LandLordBidDetails(),
    ),
  ];
}
