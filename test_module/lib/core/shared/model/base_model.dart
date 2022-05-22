import 'dart:convert';

import 'package:test_module/core/shared/model/error_model.dart';


BaseModel baseModelFromJson(dynamic str) =>
    BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  int? serverTime;
  int? status;
  String? message;
  int? errorCode;
  String? type;
  dynamic data;
  List<Errors>? errors = [];

  BaseModel(
      {this.serverTime,
      this.status,
      this.message,
      this.errorCode,
      this.type,
      this.data,
      this.errors});

  BaseModel.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    status = json['status'];
    message = json['message'];
    type = json['type'];
    errorCode = json['error_code'];
    if (json['data'] != null) {
      data = json['data'];
    }
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['server_time'] = serverTime;
    json['status'] = status;
    json['message'] = message;
    json['type'] = type;
    json['error_code'] = errorCode;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    if (errors != null) {
      json['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}
