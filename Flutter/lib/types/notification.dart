
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  int? id;
  String? userId, title, description;
  bool? read;

  Notification({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.read,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

}