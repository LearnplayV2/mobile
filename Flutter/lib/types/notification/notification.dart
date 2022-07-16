
import 'package:json_annotation/json_annotation.dart';
import 'package:learnplay/types/notification/notification_description.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  int? id;
  String? userId, title;
  String? description;
  bool? read;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notification({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

}