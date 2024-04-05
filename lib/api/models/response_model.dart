// ignore_for_file: non_constant_identifier_names

import 'package:api_papi/api/models/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  ResponseModel({
    required this.status,
    required this.error,
    required this.message,
    required this.current_url,
  });

  final int status;
  final bool error;
  final MessageModel message;
  final String current_url;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
