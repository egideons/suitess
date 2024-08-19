class ApiUrl {
//======= Base URL ========\\
  static const baseUrl = "https://auth.suitess.org";

//======= Auth Section ========\\
  static const auth = "/api/v1/user/auth";
  static const register = "/register";
  static const login = "/login";
  static const sendEmailOTP = "/send-email-otp";
  static const sendPhoneOTP = "/send-otp";
  static const verifyOTP = "/verify-email-otp";
  static const resetPasswordOTP = "/reset-password-otp";
  static const resetPasswordOTPVerify = "/reset-password-otp-verify";
  static const resetPasswordUpdatePassword = "/reset-password-update-password";
}
