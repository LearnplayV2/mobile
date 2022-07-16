import 'package:json_annotation/json_annotation.dart';
import 'package:learnplay/types/notification/notification_type_enum.dart';

part 'notification_description.g.dart';

@JsonSerializable()
class NotificationDescription {
  NotificationTypeEnum? type;
  String? body;
  List<dynamic>? data;

  NotificationDescription({
    this.type,
    this.body,
    this.data,
  });

  factory NotificationDescription.fromJson(Map<String, dynamic> json) =>
      _$NotificationDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDescriptionToJson(this);
  
}
