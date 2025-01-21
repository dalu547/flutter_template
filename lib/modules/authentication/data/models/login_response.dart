import 'package:template/core/base/base_response.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

class LoginResponse extends BaseResponse {
  String email;
  String name;
  int id;

  LoginResponse({
    required this.email,
    required this.name,
    required this.id,
  });

  LoginResponse copyWith({
    String? email,
    String? name,
    int? id,
  }) {
    return LoginResponse(
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

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
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

    return other is LoginResponse &&
        other.email == email &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ id.hashCode;

  // Add this function to map the response to the entity
  LoginEntity toEntity() {
    return LoginEntity(
      email: email,
      name: name,
      id: id,
    );
  }
}
