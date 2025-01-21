import 'package:template/core/base/base_response.dart';
import 'package:template/modules/authentication/domain/entities/register_entity.dart';

class RegisterResponse extends BaseResponse {
  String email;
  String name;
  int id;

  RegisterResponse({
    required this.email,
    required this.name,
    required this.id,
  });

  RegisterResponse copyWith({
    String? email,
    String? name,
    int? id,
  }) {
    return RegisterResponse(
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

  factory RegisterResponse.fromJson(Map<String, dynamic> map) {
    return RegisterResponse(
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

    return other is RegisterResponse &&
        other.email == email &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ id.hashCode;

  // Add this function to map the response to the entity
  RegisterEntity toEntity() {
    return RegisterEntity(
      email: email,
      name: name,
      id: id,
    );
  }
}
