import 'package:template/core/base/base_response.dart';
import 'package:template/modules/authentication/domain/entities/forgot_password_entity.dart';

class ForgotPasswordResponse extends BaseResponse {
  String email;
  String name;
  int id;

  ForgotPasswordResponse({
    required this.email,
    required this.name,
    required this.id,
  });

  ForgotPasswordResponse copyWith({
    String? email,
    String? name,
    int? id,
  }) {
    return ForgotPasswordResponse(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'id': id,
    };
  }

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> map) {
    return ForgotPasswordResponse(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  @override
  String toString() =>
      'AuthenticationResponse(email: $email, name: $name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForgotPasswordResponse &&
        other.email == email &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ id.hashCode;

  // Add this function to map the response to the entity
  ForgotPasswordEntity toEntity() {
    return ForgotPasswordEntity(
      email: email,
      name: name,
      id: id,
    );
  }
}
