// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDescription _$NotificationDescriptionFromJson(
        Map<String, dynamic> json) =>
    NotificationDescription(
      type: json['type'] as String?,
      body: json['body'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$NotificationDescriptionToJson(
        NotificationDescription instance) =>
    <String, dynamic>{
      'type': instance.type,
      'body': instance.body,
      'data': instance.data,
    };
