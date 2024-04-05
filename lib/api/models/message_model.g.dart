// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String,
      user_name: json['user_name'] as String,
      first_name: json['first_name'] as String,
      second_name: json['second_name'] as String,
      first_last_name: json['first_last_name'] as String,
      second_last_name: json['second_last_name'] as String,
      cellphone: json['cellphone'] as String,
      email: json['email'] as String,
      jwt: json['jwt'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.user_name,
      'first_name': instance.first_name,
      'second_name': instance.second_name,
      'first_last_name': instance.first_last_name,
      'second_last_name': instance.second_last_name,
      'cellphone': instance.cellphone,
      'email': instance.email,
      'jwt': instance.jwt,
    };
