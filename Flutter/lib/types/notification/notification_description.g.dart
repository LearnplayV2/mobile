// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDescription _$NotificationDescriptionFromJson(
        Map<String, dynamic> json) =>
    NotificationDescription(
      type: $enumDecodeNullable(_$NotificationTypeEnumEnumMap, json['type']),
      body: json['body'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$NotificationDescriptionToJson(
        NotificationDescription instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeEnumEnumMap[instance.type],
      'body': instance.body,
      'data': instance.data,
    };

const _$NotificationTypeEnumEnumMap = {
  NotificationTypeEnum.user_profile_visit: 'user.profile.visit',
};
