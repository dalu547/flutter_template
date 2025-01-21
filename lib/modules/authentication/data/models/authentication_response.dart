import 'package:template/core/base/base_response.dart';

class AuthenticationResponse extends BaseResponse {
  String email;
  String name;
  int id;
  AuthenticationResponse({
    required this.email,
    required this.name,
    required this.id,
  });

  AuthenticationResponse copyWith({
    String? email,
    String? name,
    int? id,
  }) {
    return AuthenticationResponse(
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

  factory AuthenticationResponse.fromJson(Map<String, dynamic> map) {
    return AuthenticationResponse(
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

    return other is AuthenticationResponse &&
        other.email == email &&
        other.name == name &&
        other.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ id.hashCode;
}
