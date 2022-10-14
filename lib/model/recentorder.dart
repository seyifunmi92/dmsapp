import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';

class RecentDms {
  RecentDms({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  Data? data;
  String? status;
  String? statusCode;
  String? message;

  factory RecentDms.fromJson(Map<String, dynamic> json) => RecentDms(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}

class Data {
  Data({
    this.dmsOrder,
  });

  DmsOrder? dmsOrder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dmsOrder: DmsOrder.fromJson(json["dmsOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "dmsOrder": dmsOrder!.toJson(),
      };
}

class DmsOrder {
  DmsOrder({
    this.id,
    this.dateCreated,
    this.orderSapNumber,
    this.parentOrderSapNumber,
    this.isAtc,
    this.companyCode,
    this.countryCode,
    this.distributorSapAccountId,
    this.orderStatusId,
    this.orderTypeId,
    this.shoppingCartId,
    this.estimatedNetValue,
    this.orderSapNetValue,
    this.deliveryDate,
    this.deliveryAddress,
    this.truckSizeCode,
    this.deliveryCity,
    this.plantCode,
    this.sapVat,
    this.sapFreightCharges,
    this.distributorSapAccount,
    this.orderStatus,
    this.orderType,
    this.deliveryStatus,
    this.deliveryState,
    this.deliveryCountry,
    this.plant,
    this.truckSize,
    this.delivery,
    this.deliveryMethod,
    this.orderItems,
  });

  int? id;
  DateTime? dateCreated;
  String? orderSapNumber;
  dynamic? parentOrderSapNumber;
  bool? isAtc;
  String? companyCode;
  String? countryCode;
  int? distributorSapAccountId;
  int? orderStatusId;
  int? orderTypeId;
  int? shoppingCartId;
  double? estimatedNetValue;
  double? orderSapNetValue;
  DateTime? deliveryDate;
  String? deliveryAddress;
  dynamic truckSizeCode;
  String? deliveryCity;
  dynamic plantCode;
  dynamic sapVat;
  dynamic sapFreightCharges;
  DistributorSapAccount? distributorSapAccount;
  Order? orderStatus;
  Order? orderType;
  dynamic deliveryStatus;
  dynamic deliveryState;
  dynamic deliveryCountry;
  dynamic plant;
  DeliveryMethod? truckSize;
  dynamic delivery;
  DeliveryMethod? deliveryMethod;
  List<OrderItem>? orderItems;

  factory DmsOrder.fromJson(Map<String, dynamic> json) => DmsOrder(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        orderSapNumber: json["orderSapNumber"],
        parentOrderSapNumber: json["parentOrderSapNumber"],
        isAtc: json["isAtc"],
        companyCode: json["companyCode"],
        countryCode: json["countryCode"],
        distributorSapAccountId: json["distributorSapAccountId"],
        orderStatusId: json["orderStatusId"],
        orderTypeId: json["orderTypeId"],
        shoppingCartId: json["shoppingCartId"],
        estimatedNetValue: json["estimatedNetValue"],
        orderSapNetValue: json["orderSapNetValue"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        deliveryAddress: json["deliveryAddress"],
        truckSizeCode: json["truckSizeCode"],
        deliveryCity: json["deliveryCity"],
        plantCode: json["plantCode"],
        sapVat: json["sapVat"],
        sapFreightCharges: json["sapFreightCharges"],
        distributorSapAccount:
            DistributorSapAccount.fromJson(json["distributorSapAccount"]),
        orderStatus: Order.fromJson(json["orderStatus"]),
        orderType: Order.fromJson(json["orderType"]),
        deliveryStatus: json["deliveryStatus"],
        deliveryState: json["deliveryState"],
        deliveryCountry: json["deliveryCountry"],
        plant: json["plant"],
        truckSize: DeliveryMethod.fromJson(json["truckSize"]),
        delivery: json["delivery"],
        deliveryMethod: DeliveryMethod.fromJson(json["deliveryMethod"]),
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "orderSapNumber": orderSapNumber,
        "parentOrderSapNumber": parentOrderSapNumber,
        "isAtc": isAtc,
        "companyCode": companyCode,
        "countryCode": countryCode,
        "distributorSapAccountId": distributorSapAccountId,
        "orderStatusId": orderStatusId,
        "orderTypeId": orderTypeId,
        "shoppingCartId": shoppingCartId,
        "estimatedNetValue": estimatedNetValue,
        "orderSapNetValue": orderSapNetValue,
        "deliveryDate": deliveryDate!.toIso8601String(),
        "deliveryAddress": deliveryAddress,
        "truckSizeCode": truckSizeCode,
        "deliveryCity": deliveryCity,
        "plantCode": plantCode,
        "sapVat": sapVat,
        "sapFreightCharges": sapFreightCharges,
        "distributorSapAccount": distributorSapAccount!.toJson(),
        "orderStatus": orderStatus!.toJson(),
        "orderType": orderType!.toJson(),
        "deliveryStatus": deliveryStatus,
        "deliveryState": deliveryState,
        "deliveryCountry": deliveryCountry,
        "plant": plant,
        "truckSize": truckSize!.toJson(),
        "delivery": delivery,
        "deliveryMethod": deliveryMethod!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class DeliveryMethod {
  DeliveryMethod({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DeliveryMethod.fromJson(Map<String, dynamic> json) => DeliveryMethod(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class DistributorSapAccount {
  DistributorSapAccount({
    this.distributorSapAccountId,
    this.userId,
    this.distributorSapNumber,
    this.distributorName,
    this.dateRefreshed,
    this.companyCode,
    this.countryCode,
    this.accountType,
  });

  int? distributorSapAccountId;
  int? userId;
  String? distributorSapNumber;
  String? distributorName;
  DateTime? dateRefreshed;
  dynamic companyCode;
  dynamic countryCode;
  dynamic accountType;

  factory DistributorSapAccount.fromJson(Map<String, dynamic> json) =>
      DistributorSapAccount(
        distributorSapAccountId: json["distributorSapAccountId"],
        userId: json["userId"],
        distributorSapNumber: json["distributorSapNumber"],
        distributorName: json["distributorName"],
        dateRefreshed: DateTime.parse(json["dateRefreshed"]),
        companyCode: json["companyCode"],
        countryCode: json["countryCode"],
        accountType: json["accountType"],
      );

  Map<String, dynamic> toJson() => {
        "distributorSapAccountId": distributorSapAccountId,
        "userId": userId,
        "distributorSapNumber": distributorSapNumber,
        "distributorName": distributorName,
        "dateRefreshed": dateRefreshed!.toIso8601String(),
        "companyCode": companyCode,
        "countryCode": countryCode,
        "accountType": accountType,
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.dateCreated,
    this.dateModified,
    this.orderId,
    this.userId,
    this.orderItemSapNumber,
    this.quantity,
    this.salesUnitOfMeasureCode,
    this.productId,
    this.sapPricePerUnit,
    this.sapNetValue,
    this.sapDeliveryQuality,
    this.product,
    this.salesUnitOfMeasure,
  });

  int? id;
  DateTime? dateCreated;
  dynamic dateModified;
  int? orderId;
  int? userId;
  dynamic orderItemSapNumber;
  double? quantity;
  dynamic salesUnitOfMeasureCode;
  int? productId;
  dynamic sapPricePerUnit;
  dynamic sapNetValue;
  dynamic sapDeliveryQuality;
  Product? product;
  dynamic salesUnitOfMeasure;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: json["dateModified"],
        orderId: json["orderId"],
        userId: json["userId"],
        orderItemSapNumber: json["orderItemSapNumber"],
        quantity: json["quantity"],
        salesUnitOfMeasureCode: json["salesUnitOfMeasureCode"],
        productId: json["productId"],
        sapPricePerUnit: json["sapPricePerUnit"],
        sapNetValue: json["sapNetValue"],
        sapDeliveryQuality: json["sapDeliveryQuality"],
        product: Product.fromJson(json["product"]),
        salesUnitOfMeasure: json["salesUnitOfMeasure"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified,
        "orderId": orderId,
        "userId": userId,
        "orderItemSapNumber": orderItemSapNumber,
        "quantity": quantity,
        "salesUnitOfMeasureCode": salesUnitOfMeasureCode,
        "productId": productId,
        "sapPricePerUnit": sapPricePerUnit,
        "sapNetValue": sapNetValue,
        "sapDeliveryQuality": sapDeliveryQuality,
        "product": product!.toJson(),
        "salesUnitOfMeasure": salesUnitOfMeasure,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.productSapNumber,
    this.companyCode,
    this.countryCode,
    this.unitOfMeasureCode,
    this.dateRefreshed,
    this.price,
  });

  int? id;
  String? name;
  dynamic productSapNumber;
  dynamic companyCode;
  dynamic countryCode;
  dynamic unitOfMeasureCode;
  DateTime? dateRefreshed;
  double? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        productSapNumber: json["productSapNumber"],
        companyCode: json["companyCode"],
        countryCode: json["countryCode"],
        unitOfMeasureCode: json["unitOfMeasureCode"],
        dateRefreshed: DateTime.parse(json["dateRefreshed"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productSapNumber": productSapNumber,
        "companyCode": companyCode,
        "countryCode": countryCode,
        "unitOfMeasureCode": unitOfMeasureCode,
        "dateRefreshed": dateRefreshed!.toIso8601String(),
        "price": price,
      };
}

class Order {
  Order({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
      };
}
