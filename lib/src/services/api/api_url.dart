class ApiUrl {
//============= Base URL ===============\\
  static const authBaseUrl = "https://auth.suitess.org";
  static const businessBaseUrl = "https://bussiness.suitess.org";
  static const transactionBaseUrl = "https://transaction.suitess.org";

//============ Auth Section =============\\
  static const auth = "/api/v1/user/auth";
  static const register = "/register";
  static const login = "/login";
  static const sendEmailOTP = "/send-email-otp";
  static const sendPhoneOTP = "/send-otp";
  static const verifyOTP = "/verify-email-otp";
  static const resetPasswordOTP = "/reset-password-otp";
  static const resetPasswordOTPVerify = "/reset-password-otp-verify";
  static const resetPasswordUpdatePassword = "/reset-password-update-password";
  static const updatePassword = "/settings/password/update";

  //============= User Profile ================\\
  static const getUserProfile = "/settings/profile?=";

  //=============== Business ====================\\
}
