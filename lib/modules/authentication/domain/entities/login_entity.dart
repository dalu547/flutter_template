class LoginEntity {
  final String email;
  final String password;
  final String imei;
  final String deviceType;

  LoginEntity({
    required this.email,
    required this.password,
    required this.imei,
    required this.deviceType,
  });

  // Business logic: Validate email format
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  // Business logic: Validate password strength
  bool isValidPassword() {
    return password.length >= 8;
  }
}
