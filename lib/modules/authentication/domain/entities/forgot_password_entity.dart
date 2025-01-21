class ForgotPasswordEntity {
  final String email;
  final String name;
  final int id;

  ForgotPasswordEntity({
    required this.email,
    required this.name,
    required this.id,
  });

  // Business logic: Validate email format
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }
}
