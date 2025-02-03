class LoginEntity {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;

  LoginEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  // Business logic: Validate email format
  bool isValidEmail() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // Business logic: Check if the access token is valid
  bool hasValidAccessToken() {
    return accessToken.isNotEmpty;
  }

  @override
  String toString() {
    return 'LoginEntity(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, image: $image, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginEntity &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.image == image &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode;
  }
}
