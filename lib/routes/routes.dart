import 'package:get/get.dart';
import 'package:suitess/views/android/auth/email_otp/screen/android_email_otp.dart';
import 'package:suitess/views/android/auth/login/screen/android_login.dart';
import 'package:suitess/views/android/auth/phone_otp/screen/android_phone_otp.dart';
import 'package:suitess/views/android/auth/reset_password/screen/android_reset_password.dart';
import 'package:suitess/views/android/auth/reset_password_options/via_email/screen/android_reset_password_via_email.dart';
import 'package:suitess/views/android/auth/reset_password_options/via_sms/screen/android_reset_password_via_sms.dart';
import 'package:suitess/views/android/auth/reset_password_otp/via_email/screen/android_reset_password_via_email_otp.dart';
import 'package:suitess/views/android/auth/reset_password_otp/via_sms/screen/android_reset_password_via_sms_otp.dart';
import 'package:suitess/views/android/auth/signup/screen/android_signup_screen.dart';
import 'package:suitess/views/android/bottom_nav_view/screen/android_bottom_navigation_view.dart';
import 'package:suitess/views/android/kyc/kyc_add_location/screen/android_kyc_add_location.dart';
import 'package:suitess/views/android/kyc/kyc_bvn/screen/android_kyc_bvn.dart';
import 'package:suitess/views/android/kyc/kyc_bvn_otp/screen/android_kyc_bvn_otp.dart';
import 'package:suitess/views/android/kyc/kyc_nin/screen/android_kyc_nin_screen.dart';
import 'package:suitess/views/android/kyc/kyc_profile_photo/screen/android_kyc_profile_photo_screen.dart';
import 'package:suitess/views/android/onboarding/screen/onboarding_screen.dart';
import 'package:suitess/views/android/screens/bid_details/screen/android_bid_details_screen.dart';
import 'package:suitess/views/android/screens/chat/screen/android_chat_screen.dart';
import 'package:suitess/views/android/screens/home/screen/android_home_screen.dart';
import 'package:suitess/views/android/screens/messages/screen/android_messages_screen.dart';
import 'package:suitess/views/android/screens/my%20_business/business_intro/screen/android_business_intro_screen.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/add_property/screen/android_add_property_screen.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/properties_home/screen/android_lands_and_properties_screen.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/upload_property_images/screen/android_upload_property_images_screen.dart';
import 'package:suitess/views/android/screens/notifications/screen/android_notifications_screen.dart';
import 'package:suitess/views/android/screens/profile/screen/android_profile_screen.dart';
import 'package:suitess/views/android/screens/profile/views/account_type/screen/android_account_type_screen.dart';
import 'package:suitess/views/android/screens/profile/views/contact_details/screen/android_contact_details.dart';
import 'package:suitess/views/android/screens/profile/views/faqs/screen/android_faqs_screen.dart';
import 'package:suitess/views/android/screens/profile/views/notifications_settings/screen/android_notifications_settings_screen.dart';
import 'package:suitess/views/android/screens/profile/views/password_settings/screen/android_password_settings_screen.dart';
import 'package:suitess/views/android/screens/profile/views/privacy_and_security/screen/android_privacy_and_security_screen.dart';
import 'package:suitess/views/android/screens/profile/views/support_and_feedback/screen/android_support_and_feedback_screen.dart';
import 'package:suitess/views/android/screens/profile/views/wallet_information/screen/android_wallet_information_screen.dart';
import 'package:suitess/views/android/screens/property/book_appointment/screen/android_book_appointment_screen.dart';
import 'package:suitess/views/android/screens/property/checkout_property/screen/android_checkout_property_screen.dart';
import 'package:suitess/views/android/screens/property/purchase_property/screen/android_purchase_property_screen.dart';
import 'package:suitess/views/android/screens/property/view_property/screen/android_view_property_screen.dart';
import 'package:suitess/views/android/screens/search/screen/android_search_screen.dart';
import 'package:suitess/views/android/screens/wallet/airtime_purchase/screen/airtime_purchase_screen.dart';
import 'package:suitess/views/android/screens/wallet/bank_transfer/screen/android_bank_transfer_screen.dart';
import 'package:suitess/views/android/screens/wallet/mobile_data/screen/android_mobile_data_screen.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin/screen/reset_tx_pin.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin_otp/screen/reset_tx_pin_otp.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/via_email/screen/reset_tx_pin_via_email.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/via_sms/screen/reset_tx_pin_via_sms.dart';
import 'package:suitess/views/android/screens/wallet/transfer_options/screen/android_transfer_options.dart';
import 'package:suitess/views/android/screens/wallet/wallet_intro/screen/android_wallet_intro_screen.dart';
import 'package:suitess/views/android/screens/wallet/wallet_screen/screen/android_wallet_screen.dart';
import 'package:suitess/views/android/screens/wallet/wallet_transfer/screen/android_wallet_transfer_screen.dart';
import 'package:suitess/views/android/splash/congratulations/screen/congratulations_screen.dart';
import 'package:suitess/views/android/splash/loading/screen/android_loading_screen.dart';
import 'package:suitess/views/android/splash/startup/screen/android_startup_screen.dart';
import 'package:suitess/views/android/splash/successful/screen/android_success_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const congratulationsSplashScreen = "/congratulations-splash";
  static const successSplashScreen = "/success-splash";
  static const loadingScreen = "/loading";

  static const successScreen = "/success-screen";

  //AndroidOnboardingScreen
  static const onboarding = "/onboarding";

  //Locked Screen
  static const lockedScreen = "/lockedScreen";

  //Auth Screens
  static const signup = "/signup";
  static const login = "/login";
  static const emailOTP = "/email-otp";
  static const phoneOTP = "/phone-otp";
  static const resetPassword = "/reset-password";
  static const androidChangePassword = "/change-password";
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

  //Home Section
  static const bottomNavView = "/bottom-navigation-view";
  static const homeScreen = "/homescreen";
  static const notificationsScreen = "/notifications";
  static const viewProperty = "/view-property";
  static const bookAppointment = "/book-appointment";
  static const purchaseProperty = "/purchase-property";
  static const checkoutProperty = "/checkout-property";
  static const searchScreen = "/search";
  static const bidDetailsScreen = "/bid-details";

  //Wallet Section
  static const walletIntroScreen = "/wallet-intro";
  static const walletScreen = "/wallet";
  static const transferOptions = "/transfer-options";
  static const walletTransfer = "/wallet-transfer";
  static const bankTransfer = "/bank-transfer";
  static const airtimePurchase = "/airtime-purchase";
  static const mobileData = "/mobile-data";
  static const electricityBill = "/electricity-bill";
  static const resetTxPin = "/reset-tx-pin";
  static const resetTxPinViaEmail = "/reset-tx-pin-via-email";
  static const resetTxPinViaSms = "/reset-tx-pin-via-sms";
  static const resetTxPinOTP = "/reset-tx-pin-otp";

  //Messages Section
  static const messagesScreen = "/messages";
  static const chatScreen = "/chat";
  static const callScreen = "/call";

  //Profile Section
  static const profileScreen = "/profile";
  static const contactDetails = "/contact-details";
  static const passwordSettings = "/password-settings";
  static const walletInformation = "/wallet-information";
  static const accountType = "/account-type";
  static const businessIntro = "/business-intro";
  static const landsAndProperties = "/lands-and-properties";
  static const hotelManagement = "/hotel-management";
  static const recentlyViewed = "/recently-viewed";
  static const scheduledAppointments = "/scheduled-appointments";
  static const transactionsAndOffers = "/transactions-and-offers";
  static const notificationsSettings = "/notifications-settings";
  static const privacyAndSecurity = "/privacy-and-security";
  static const faqs = "/faqs";
  static const supportAndFeedback = "/support-and-feedback";

  //Business Section
  static const addProperty = "/add-property";
  static const uploadPropertyImages = "/upload-property-images";
  static const updateProperty = "/update-property";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Splash Screens
    GetPage(
        name: startupSplashscreen, page: () => const AndroidStartupScreen()),
    GetPage(
      name: congratulationsSplashScreen,
      page: () => const AndroidCongratulationsSplashScreen(),
    ),
    // GetPage(name: successSplashScreen, page: () => const SuccesssSplashscreen()),
    GetPage(name: loadingScreen, page: () => const AndroidLoadingScreen()),

    //Auth Pages
    GetPage(name: onboarding, page: () => const AndroidOnboardingScreen()),
    GetPage(name: signup, page: () => const AndroidSignupScreen()),
    GetPage(name: login, page: () => const AndroidLoginScreen()),
    GetPage(name: emailOTP, page: () => const AndroidEmailOTP()),
    GetPage(name: phoneOTP, page: () => const AndroidPhoneOTPScreen()),
    GetPage(
        name: resetPasswordViaEmail,
        page: () => const AndroidResetPasswordViaEmailScreen()),
    GetPage(
        name: resetPasswordViaEmailOTP,
        page: () => const AndroidResetPasswordViaEmailOTP()),
    GetPage(
        name: resetPasswordViaSms,
        page: () => const AndroidResetPasswordViaSMS()),
    GetPage(
        name: resetPasswordViaSmsOTP,
        page: () => const AndroidResetPasswordViaSMSOTP()),
    GetPage(name: resetPassword, page: () => const AndroidResetPassword()),
    GetPage(name: kycAddLocation, page: () => const AndroidKycAddLocation()),
    GetPage(name: kycBvn, page: () => const AndroidKycBvnScreen()),
    GetPage(name: kycBvnOTP, page: () => const AndroidKycBvnOTPScreen()),
    GetPage(name: kycNin, page: () => const AndroidKycNINScreen()),
    GetPage(
        name: kyProfilePhoto, page: () => const AndroidKycProfilePhotoScreen()),

    //Home Section
    GetPage(
        name: bottomNavView, page: () => const AndroidBottomNavigationView()),
    GetPage(name: homeScreen, page: () => const AndroidHomeScreen()),
    GetPage(
        name: notificationsScreen,
        page: () => const AndroidNotificationsScreen()),
    GetPage(name: viewProperty, page: () => const AndroidViewPropertyScreen()),
    GetPage(
        name: bidDetailsScreen, page: () => const AndroidBidDetailsScreen()),
    GetPage(
        name: bookAppointment,
        page: () => const AndroidBookAppointmentScreen()),
    GetPage(
        name: purchaseProperty,
        page: () => const AndroidPurchasePropertyScreen()),
    GetPage(
        name: checkoutProperty,
        page: () => const AndroidCheckoutPropertyScreen()),
    GetPage(name: successScreen, page: () => const AndroidSuccessScreen()),
    GetPage(name: searchScreen, page: () => const AndroidSearchScreen()),

    //Messages Section
    GetPage(name: messagesScreen, page: () => const AndroidMessagesScreen()),
    GetPage(name: chatScreen, page: () => const AndroidChatScreen()),
    // GetPage(name: callScreen, page: () => const CallScreen()),

    //Wallet Section
    GetPage(
        name: walletIntroScreen, page: () => const AndroidWalletIntroScreen()),
    GetPage(name: walletScreen, page: () => const AndroidWalletScreen()),
    GetPage(
        name: transferOptions,
        page: () => const AndroidTransferOptionsScreen()),
    GetPage(
        name: walletTransfer, page: () => const AndroidWalletTransferScreen()),
    GetPage(name: bankTransfer, page: () => const AndroidBankTransferScreen()),
    GetPage(name: airtimePurchase, page: () => const AirtimePurchaseScreen()),
    GetPage(name: mobileData, page: () => const AndroidMobileDataScreen()),
    GetPage(name: resetTxPinViaEmail, page: () => const ResetTxPinViaEmail()),
    GetPage(name: resetTxPinViaSms, page: () => const ResetTxPinViaSms()),
    GetPage(name: resetTxPinOTP, page: () => const ResetTxPinOTP()),
    GetPage(name: resetTxPin, page: () => const ResetTxPin()),
    GetPage(name: resetTxPin, page: () => const AndroidMobileDataScreen()),

    //Profile Section
    GetPage(name: profileScreen, page: () => const AndroidProfileScreen()),
    GetPage(
        name: contactDetails, page: () => const AndroidContactDetailsScreen()),
    GetPage(
        name: passwordSettings,
        page: () => const AndroidPasswordSettingsScreen()),
    GetPage(
        name: walletInformation,
        page: () => const AndroidWalletInformationScreen()),
    GetPage(name: accountType, page: () => const AndroidAccountTypeScreen()),
    GetPage(
      name: notificationsSettings,
      page: () => const AndroidNotificationsSettingsScreen(),
    ),
    GetPage(
      name: privacyAndSecurity,
      page: () => const AndroidPrivacyAndSecurityScreen(),
    ),
    GetPage(
      name: faqs,
      page: () => const AndroidFaqsScreen(),
    ),
    GetPage(
      name: supportAndFeedback,
      page: () => const AndroidSupportAndFeedbackScreen(),
    ),

    //Business Section
    GetPage(
        name: businessIntro, page: () => const AndroidBusinessIntroScreen()),
    GetPage(
      name: landsAndProperties,
      page: () => const AndroidLandsAndPropertiesScreen(),
    ),
    GetPage(name: addProperty, page: () => const AndroidAddPropertyScreen()),
    GetPage(
      name: uploadPropertyImages,
      page: () => const AndroidUploadPropertyImagesScreen(),
    ),
    // GetPage(name: updateProperty, page: () => const UpdatePropertyScreen()),
    // GetPage(name: hotelManagement, page: () => const HotelManagementScreen()),
    // GetPage(name: landLordAddProperty, page: () => const LandLordAddProperty()),
  ];
}
