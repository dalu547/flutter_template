import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:template/core/base/base_response.dart';

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "id")
  String id;

  AuthenticationResponse({
    required this.email,
    required this.name,
    required this.id,
  });

  AuthenticationResponse copyWith({
    String? email,
    String? name,
    String? id,
  }) {
    return AuthenticationResponse(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'id': id,
    };
  }

  factory AuthenticationResponse.fromMap(Map<String, dynamic> map) {
    return AuthenticationResponse(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationResponse.fromJson(String source) =>
      AuthenticationResponse.fromMap(json.decode(source));

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
