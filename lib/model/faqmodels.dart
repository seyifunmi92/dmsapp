import 'package:flutter/material.dart';

class Faq {
  Faq({
    this.categoryId,
    this.name,
  });

  int? categoryId;
  String? name;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        categoryId: json["categoryId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "name": name,
      };
}

class Contact {
  Contact({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  String? statusCode;
  String? status;
  String? message;
  Data? data;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
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
    this.contact,
  });

  ContactClass? contact;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        contact: ContactClass.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "contact": contact!.toJson(),
      };
}

class ContactClass {
  ContactClass({
    this.telephone1,
    this.telephone2,
    this.email,
    this.address,
  });

  String? telephone1;
  String? telephone2;
  String? email;
  String? address;

  factory ContactClass.fromJson(Map<String, dynamic> json) => ContactClass(
        telephone1: json["telephone1"],
        telephone2: json["telephone2"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "telephone1": telephone1,
        "telephone2": telephone2,
        "email": email,
        "address": address,
      };
}

class Faqcategory {
  Faqcategory({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  String? statusCode;
  String? status;
  String? message;
  DataFaq? data;

  factory Faqcategory.fromJson(Map<String, dynamic> json) => Faqcategory(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: DataFaq.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataFaq {
  DataFaq({
    this.pagination,
    this.faqs,
  });

  Pagination1? pagination;
  List<Faq1>? faqs;

  factory DataFaq.fromJson(Map<String, dynamic> json) => DataFaq(
        pagination: Pagination1.fromJson(json["pagination"]),
        faqs: List<Faq1>.from(json["faqs"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "faqs": List<dynamic>.from(faqs!.map((x) => x.toJson())),
      };
}

class Faq1 {
  Faq1({
    this.faqId,
    this.question,
    this.answer,
    this.faqCategory,
  });

  int? faqId;
  String? question;
  String? answer;
  FaqCategory? faqCategory;

  factory Faq1.fromJson(Map<String, dynamic> json) => Faq1(
        faqId: json["faqId"],
        question: json["question"],
        answer: json["answer"],
        faqCategory: FaqCategory.fromJson(json["faqCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "faqId": faqId,
        "question": question,
        "answer": answer,
        "faqCategory": faqCategory!.toJson(),
      };
}

class FaqCategory {
  FaqCategory({
    this.categoryId,
    this.name,
  });

  int? categoryId;
  String? name;

  factory FaqCategory.fromJson(Map<String, dynamic> json) => FaqCategory(
        categoryId: json["categoryId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "name": name,
      };
}

class Pagination1 {
  Pagination1({
    this.pageIndex,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
  });

  int? pageIndex;
  int? pageSize;
  int? totalPages;
  int? totalRecords;

  factory Pagination1.fromJson(Map<String, dynamic> json) => Pagination1(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
      };
}
