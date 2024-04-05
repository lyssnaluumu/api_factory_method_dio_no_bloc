// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  MessageModel({
    required this.id,
    required this.user_name,
    required this.first_name,
    required this.second_name,
    required this.first_last_name,
    required this.second_last_name,
    required this.cellphone,
    required this.email,
    required this.jwt,
  });

  final String id;
  final String user_name;
  final String first_name;
  final String second_name;
  final String first_last_name;
  final String second_last_name;
  final String cellphone;
  final String email;
  final String jwt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
