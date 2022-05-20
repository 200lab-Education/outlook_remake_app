// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) => Email(
      name: json['name'] as String?,
      image: json['image'] as String?,
      subject: json['subject'] as String?,
      isAttachmentAvailable: json['isAttachmentAvailable'] as bool?,
      isChecked: json['isChecked'] as bool?,
      time: json['time'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'subject': instance.subject,
      'isAttachmentAvailable': instance.isAttachmentAvailable,
      'isChecked': instance.isChecked,
      'time': instance.time,
      'body': instance.body,
    };
