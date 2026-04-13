class ApiConstants {
  static const int sendTimeoutSeconds = 60;
  static const int receiveTimeoutSeconds = 60;
  static const String bearer = 'Bearer';
  static const String applicationJson = 'application/json';
  static const String baseUrl = 'https://discount-platform.onrender.com/api/';
  static const String register = '${baseUrl}auth/register';
  static const String registerByGoogle = '${baseUrl}auth/register-by-google';
  static const String logout = '${baseUrl}auth/logout';
  static const String resendOtp = '${baseUrl}auth/resend-otp';
  static const String resetPassword = '${baseUrl}auth/reset-password';
  static const String verifyOtp = '${baseUrl}auth/verify-otp';
  static const String login = '${baseUrl}auth/login';
  static const String loginByGoogle = '${baseUrl}auth/login';
  static const String forgotPassword = '${baseUrl}auth/forgot-password';
  static const String profile = '${baseUrl}auth/me';
  static const String editProfile = '${baseUrl}users/';
  static const String sectors = '${baseUrl}sectors/';
}

class ApiKeys {
  static const String contentType = 'Content-Type';
  static const String authorization = 'Authorization';
  static const String message = 'message';

  // Login / generic response keys
  static const String success = 'success';
  static const String statusCode = 'statusCode';
  static const String timestamp = 'timestamp';
  static const String path = 'path';
  static const String data = 'data';

  // Auth / user keys
  static const String user = 'user';
  static const String token = 'token';
  static const String id = 'id';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String phoneNumber = 'phone_number';
  static const String email = 'email';
  static const String role = 'role';
  static const String governorate = 'governorate';
  static const String wilaya = 'wilaya';
  static const String status = 'status';
  static const String fcmToken = 'fcm_token';
  static const String avatarUrl = 'avatar_url';
  static const String avatarPublicId = 'avatar_public_id';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String password = 'password';
  static const String passwordConfirm = 'password_confirm';
  static const String requiresVerification = 'requires_verification';
  static const String otp = 'otp';
  static const String otpType = 'otp_type';
  static const String resetToken = 'reset_token';
  static const String registrationType  = 'REGISTRATION';
  static const String passwordResetToken  = 'password_reset_token';
  static const String passwordResetExpires  = 'password_reset_expires';
  static const String isVerified  = 'is_verified';
  static const String otpExpires  = 'otp_expires';
  static const String otpAttempts  = 'otp_attempts';
  static const String lastOtpSentAt  = 'last_otp_sent_at';
  static const String otpHash  = 'otp_hash';

  // Sector keys
  static const String name = 'name';
  static const String iconUrl = 'icon_url';
  static const String isActive = 'is_active';
  static const String isComingSoon = 'is_coming_soon';
  static const String meta = 'meta';
  static const String count = 'count';
  static const String vendors = 'vendors';

}
