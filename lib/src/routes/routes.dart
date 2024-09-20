import 'package:get/get.dart';
import 'package:suitess/app/auth/email_otp/screen/email_otp.dart';
import 'package:suitess/app/auth/signup/screen/signup.dart';
import 'package:suitess/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:suitess/app/kyc/kyc_profile_photo/screen/kyc_profile_photo.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/add_property/screen/add_property_screen.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/properties_home/screen/lands_and_properties_screen.dart';
import 'package:suitess/app/my%20_business/lands_and_properties/upload_property_images/screen/upload_property_images_screen.dart';
import 'package:suitess/app/onboarding/screen/onboarding.dart';
import 'package:suitess/app/screens/home/screen/home_screen.dart';
import 'package:suitess/app/screens/notifications/screen/notifications.dart';
import 'package:suitess/app/screens/profile/screen/profile_screen.dart';
import 'package:suitess/app/screens/profile/views/contact_details/screen/contact_details.dart';
import 'package:suitess/app/screens/property/view_property/screen/view_property.dart';
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
import '../../app/my _business/business_intro/screen/business_intro_screen.dart';
import '../../app/screens/bid_details/screen/bid_details_screen.dart';
import '../../app/screens/chat/screen/chat_screen.dart';
import '../../app/screens/messages/screen/messages_screen.dart';
import '../../app/screens/profile/views/account_type/screen/account_type_screen.dart';
import '../../app/screens/profile/views/faqs/screen/faqs_screen.dart';
import '../../app/screens/profile/views/notifications_settings/screen/notifications_settings_screen.dart';
import '../../app/screens/profile/views/password_settings/screen/password_settings_screen.dart';
import '../../app/screens/profile/views/privacy_and_security/screen/privacy_and_security_screen.dart';
import '../../app/screens/profile/views/support_and_feedback/screen/support_and_feedback_screen.dart';
import '../../app/screens/profile/views/wallet_information/screen/wallet_information_screen.dart';
import '../../app/screens/property/book_appointment/screen/book_appointment_screen.dart';
import '../../app/screens/property/checkout_property/screen/checkout_property_screen.dart';
import '../../app/screens/property/purchase_property/screen/purchase_property_screen.dart';
import '../../app/screens/search/screen/search_screen.dart';
import '../../app/screens/wallet/airtime_purchase/screen/airtime_purchase_screen.dart';
import '../../app/screens/wallet/bank_transfer/screen/bank_transfer_screen.dart';
import '../../app/screens/wallet/mobile_data/screen/mobile_data_screen.dart';
import '../../app/screens/wallet/transfer_options/screen/transfer_options.dart';
import '../../app/screens/wallet/wallet_screen/screen/wallet_screen.dart';
import '../../app/screens/wallet/wallet_transfer/screen/wallet_transfer_screen.dart';
import '../../app/screens/wallet_intro/screen/wallet_intro_screen.dart';
import '../../app/splash/congratulations/screen/congratulations_screen.dart';
import '../../app/splash/loading/screen/loading_screen.dart';
import '../../app/splash/successful/screen/success_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const congratulationsSplashScreen = "/congratulations-splash";
  static const successSplashScreen = "/success-splash";
  static const loadingScreen = "/loading";

  static const successScreen = "/success-screen";

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
        name: resetPasswordViaEmail, page: () => const ResetPasswordViaEmail()),
    GetPage(
        name: resetPasswordViaEmailOTP,
        page: () => const ResetPasswordViaEmailOTP()),
    GetPage(name: resetPasswordViaSms, page: () => const ResetPasswordViaSMS()),
    GetPage(
        name: resetPasswordViaSmsOTP,
        page: () => const ResetPasswordViaSMSOTP()),
    GetPage(name: resetPassword, page: () => const ResetPassword()),
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
    GetPage(name: kycBvn, page: () => const KycBvn()),
    GetPage(name: kycBvnOTP, page: () => const KycBvnOTP()),
    GetPage(name: kycNin, page: () => const KycNIN()),
    GetPage(name: kyProfilePhoto, page: () => const KycProfilePhoto()),

    //Home Section
    GetPage(name: bottomNavView, page: () => const BottomNavigationView()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: notificationsScreen, page: () => const NotificationsScreen()),
    GetPage(name: viewProperty, page: () => const ViewProperty()),
    GetPage(name: bidDetailsScreen, page: () => const BidDetailsScreen()),
    GetPage(name: bookAppointment, page: () => const BookAppointmentScreen()),
    GetPage(name: purchaseProperty, page: () => const PurchasePropertyScreen()),
    GetPage(name: checkoutProperty, page: () => const CheckoutPropertyScreen()),
    GetPage(name: successScreen, page: () => const SuccessScreen()),
    GetPage(name: searchScreen, page: () => const SearchScreen()),

    //Messages Section
    GetPage(name: messagesScreen, page: () => const MessagesScreen()),
    GetPage(name: chatScreen, page: () => const ChatScreen()),
    // GetPage(name: callScreen, page: () => const CallScreen()),

    //Wallet Section
    GetPage(name: walletIntroScreen, page: () => const WalletIntroScreen()),
    GetPage(name: walletScreen, page: () => const WalletScreen()),
    GetPage(name: transferOptions, page: () => const TransferOptions()),
    GetPage(name: walletTransfer, page: () => const WalletTransferScreen()),
    GetPage(name: bankTransfer, page: () => const BankTransferScreen()),
    GetPage(name: airtimePurchase, page: () => const AirtimePurchaseScreen()),
    GetPage(name: mobileData, page: () => const MobileDataScreen()),

    //Profile Section
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: contactDetails, page: () => const ContactDetails()),
    GetPage(name: passwordSettings, page: () => const PasswordSettingsScreen()),
    GetPage(
        name: walletInformation, page: () => const WalletInformationScreen()),
    GetPage(name: accountType, page: () => const AccountTypeScreen()),
    GetPage(
      name: notificationsSettings,
      page: () => const NotificationsSettingsScreen(),
    ),
    GetPage(
      name: privacyAndSecurity,
      page: () => const PrivacyAndSecurityScreen(),
    ),
    GetPage(
      name: faqs,
      page: () => const FaqsScreen(),
    ),
    GetPage(
      name: supportAndFeedback,
      page: () => const SupportAndFeedbackScreen(),
    ),

    //Business Section
    GetPage(name: businessIntro, page: () => const BusinessIntroScreen()),
    GetPage(
      name: landsAndProperties,
      page: () => const LandsAndPropertiesScreen(),
    ),
    GetPage(name: addProperty, page: () => const AddPropertyScreen()),
    GetPage(
      name: uploadPropertyImages,
      page: () => const UploadPropertyImagesScreen(),
    ),
    // GetPage(name: updateProperty, page: () => const UpdatePropertyScreen()),
    // GetPage(name: hotelManagement, page: () => const HotelManagementScreen()),
    // GetPage(name: landLordAddProperty, page: () => const LandLordAddProperty()),
  ];
}
