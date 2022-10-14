import 'package:flutter/material.dart';
import 'dart:convert';

class WalletDetails {
  WalletDetails({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  String? statusCode;
  String? status;
  String? message;
  Data? data;

  factory WalletDetails.fromJson(Map<String, dynamic> json) => WalletDetails(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.sapWallet,
  });

  SapWallet? sapWallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sapWallet: SapWallet.fromJson(json["sapWallet"]),
      );

  Map<String, dynamic> toJson() => {
        "sapWallet": sapWallet!.toJson(),
      };
}

class SapWallet {
  SapWallet({
    this.id,
    this.availableBalance,
  });

  int? id;
  int? availableBalance;

  factory SapWallet.fromJson(Map<String, dynamic> json) => SapWallet(
        id: json["id"],
        availableBalance: json["availableBalance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "availableBalance": availableBalance,
      };
}

class WalletStatement {
  WalletStatement({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  String? statusCode;
  String? status;
  String? message;
  Data? data;

  factory WalletStatement.fromJson(Map<String, dynamic> json) =>
      WalletStatement(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data2 {
  Data2({
    this.sapWalletStatement,
  });

  SapWalletStatement? sapWalletStatement;

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
        sapWalletStatement:
            SapWalletStatement.fromJson(json["sapWalletStatement"]),
      );

  Map<String, dynamic> toJson() => {
        "sapWalletStatement": sapWalletStatement!.toJson(),
      };
}

class SapWalletStatement {
  SapWalletStatement({
    this.walletId,
    this.availableBalance,
    this.fromDate,
    this.toDate,
    this.transactions,
  });

  String? walletId;
  int? availableBalance;
  DateTime? fromDate;
  DateTime? toDate;
  List<Transaction>? transactions;

  factory SapWalletStatement.fromJson(Map<String, dynamic> json) =>
      SapWalletStatement(
        walletId: json["walletId"],
        availableBalance: json["availableBalance"],
        fromDate: DateTime.parse(json["fromDate"]),
        toDate: DateTime.parse(json["toDate"]),
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "walletId": walletId,
        "availableBalance": availableBalance,
        "fromDate": fromDate!.toIso8601String(),
        "toDate": toDate!.toIso8601String(),
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
    this.transactionId,
    this.amount,
    this.description,
    this.transactionDate,
    this.transactionType,
  });

  String? transactionId;
  int? amount;
  String? description;
  DateTime? transactionDate;
  TransactionType? transactionType;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionId: json["transactionID"],
        amount: json["amount"],
        description: json["description"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        transactionType: TransactionType.fromJson(json["transactionType"]),
      );

  Map<String, dynamic> toJson() => {
        "transactionID": transactionId,
        "amount": amount,
        "description": description,
        "transactionDate": transactionDate!.toIso8601String(),
        "transactionType": transactionType!.toJson(),
      };
}

class TransactionType {
  TransactionType({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory TransactionType.fromJson(Map<String, dynamic> json) =>
      TransactionType(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
