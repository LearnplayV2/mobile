import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? uuid;
  String? name;
  String? password;
  String? email;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? token;

  User({
      this.uuid,
      this.name,
      this.password,
      this.email,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.token
    });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
    
}

