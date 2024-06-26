import 'package:get/get.dart';
import 'package:suitess/app/auth/email_otp/screen/email_otp.dart';
import 'package:suitess/app/auth/signup/screen/signup.dart';
import 'package:suitess/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:suitess/app/kyc/kyc_profile_photo/screen/kyc_profile_photo.dart';
import 'package:suitess/app/onboarding/screen/onboarding.dart';
import 'package:suitess/app/screens/home/screen/home_screen.dart';
import 'package:suitess/app/screens/notifications/screen/notifications.dart';
import 'package:suitess/app/screens/property/view_property/screen/landlord_view_property.dart';
import 'package:suitess/app/splash/startup/screen/startup_splash.dart';

import '../../app/auth/login/screen/login.dart';
import '../../app/auth/phone_otp/screen/phone_otp.dart';
import '../../app/auth/reset_password/screen/reset_password.dart';
import '../../app/auth/reset_password_options/via_email/screen/reset_password_via_email.dart';
import '../../app/auth/reset_password_options/via_sms/screen/reset_password_via_sms.dart';
import '../../app/auth/reset_password_otp/via_email/screen/reset_password_via_email_otp.dart';
import '../../app/auth/reset_password_otp/via_sms/screen/reset_password_via_sms_otp.dart';
import '../../app/bottom_nav_view/screen/bottom_navigation_view.dart';
import '../../app/kyc/kyc_bvn/screen/kyc_bvn.dart';
import '../../app/kyc/kyc_bvn_otp/screen/kyc_bvn_otp.dart';
import '../../app/kyc/kyc_nin/screen/kyc_nin.dart';
import '../../app/screens/bid_details/screen/bid_details.dart';
import '../../app/screens/property/add_property/screen/landlord_add_property.dart';
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
  static const phoneOTP = "/phone-otp";
  static const resetPassword = "/reset-password";
  static const changePassword = "/change-password";
  static const resetPasswordViaEmail = "/reset-password-via-email";
  static const resetPasswordViaEmailOTP = "/reset-password-via-email-otp";
  static const resetPasswordViaSms = "/reset-password-via-sms";
  static const resetPasswordViaSmsOTP = "/reset-password-via-sms-otp";

  //KYC Screens
  static const kycAddLocation = "/kyc-add-location";
  static const kycBvn = "/kyc-bvn";
  static const kycBvnOTP = "/kyc-bvn-otp";
  static const kycNin = "/kyc-nin";
  static const kyProfilePhoto = "/kyc-profile-photo";
  static const chooseExperience = "/choose-experience";

  //Landlord Section
  static const bottomNavView = "/bottom-navigation-view";
  static const homeScreen = "/landlord-homescreen";
  static const landLordWallet = "/landlord-wallet";
  static const landLordChat = "/landlord-chat";
  static const landLordProfile = "/landlord-profile";
  static const notificationsScreen = "/landlord-notifications";
  static const landLordAddProperty = "/landlord-add-property";
  static const landLordViewProperty = "/landlord-view-property";
  static const bidDetails = "/landlord-bid-details";

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
    GetPage(name: phoneOTP, page: () => const PhoneOTP()),
    GetPage(
      name: resetPasswordViaEmail,
      page: () => const ResetPasswordViaEmail(),
    ),
    GetPage(
      name: resetPasswordViaEmailOTP,
      page: () => const RestPasswordViaEmailOTP(),
    ),
    GetPage(
      name: resetPasswordViaSms,
      page: () => const ResetPasswordViaSMS(),
    ),
    GetPage(
      name: resetPasswordViaSmsOTP,
      page: () => const ResetPasswordViaSMSOTP(),
    ),
    GetPage(name: resetPassword, page: () => const ResetPassword()),

    //KYC Pages
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
    GetPage(name: kycBvn, page: () => const KycBvn()),
    GetPage(name: kycBvnOTP, page: () => const KycBvnOTP()),
    GetPage(name: kycNin, page: () => const KycNIN()),
    GetPage(name: kyProfilePhoto, page: () => const KycProfilePhoto()),

    //Main App Section
    GetPage(
      name: bottomNavView,
      page: () => const BottomNavigationView(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: notificationsScreen,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: landLordAddProperty,
      page: () => const LandLordAddProperty(),
    ),
    GetPage(
      name: landLordViewProperty,
      page: () => const LandLordViewProperty(),
    ),
    GetPage(
      name: bidDetails,
      page: () => const BidDetails(),
    ),
  ];
}
