import 'package:flutter/material.dart';

import 'dart:convert';

class AtcSubmit {
  AtcSubmit({
    this.data,
    this.statusCode,
    this.status,
    this.message,
  });

  Data? data;
  String? statusCode;
  String? status;
  String? message;

  factory AtcSubmit.fromJson(Map<String, dynamic> json) => AtcSubmit(
        data: Data.fromJson(json["data"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Data {
  Data({
    this.otp,
  });

  Otp? otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: Otp.fromJson(json["otp"]),
      );

  Map<String, dynamic> toJson() => {
        "otp": otp!.toJson(),
      };
}

class Otp {
  Otp({
    this.otpId,
  });

  int? otpId;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        otpId: json["otpId"],
      );

  Map<String, dynamic> toJson() => {
        "otpId": otpId,
      };
}
