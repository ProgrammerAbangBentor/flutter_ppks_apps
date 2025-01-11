import 'dart:convert';

class AuthResponseModel {
  final int user_id;
  final String name;
  final String email;
  final String token;

  AuthResponseModel({
    required this.user_id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        user_id: json["user_id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": user_id,
        "name": name,
        "email": email,
        "token": token,
      };
}