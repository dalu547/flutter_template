import 'package:template/core/base/base_response.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

class LoginResponse extends BaseResponse {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String accessToken;
  String refreshToken;

  LoginResponse({
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

  LoginResponse copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponse(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  @override
  String toString() {
    return 'LoginResponse(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, image: $image, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse &&
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

  // Convert to entity
  LoginEntity toEntity() {
    return LoginEntity(
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      image: image,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
