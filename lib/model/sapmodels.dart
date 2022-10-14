import 'package:flutter/material.dart';

import 'dart:convert';

class GetSapD {
  GetSapD({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  Data? data;
  String? status;
  String? statusCode;
  String? message;

  factory GetSapD.fromJson(Map<String, dynamic> json) => GetSapD(
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
    this.sapOrder,
  });

  SapOrder? sapOrder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sapOrder: SapOrder.fromJson(json["sapOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "sapOrder": sapOrder!.toJson(),
      };
}

class SapOrder {
  SapOrder({
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
  dynamic parentOrderSapNumber;
  bool? isAtc;
  String? companyCode;
  String? countryCode;
  int? distributorSapAccountId;
  int? orderStatusId;
  int? orderTypeId;
  int? shoppingCartId;
  int? estimatedNetValue;
  int? orderSapNetValue;
  DateTime? deliveryDate;
  String? deliveryAddress;
  dynamic truckSizeCode;
  String? deliveryCity;
  dynamic plantCode;
  dynamic sapVat;
  dynamic sapFreightCharges;
  DistributorSapAccount? distributorSapAccount;
  OrderStatus? orderStatus;
  OrderStatus? orderType;
  dynamic deliveryStatus;
  dynamic deliveryState;
  dynamic deliveryCountry;
  dynamic plant;
  DeliveryMethod? truckSize;
  Delivery? delivery;
  DeliveryMethod? deliveryMethod;
  List<OrderItem>? orderItems;

  factory SapOrder.fromJson(Map<String, dynamic> json) => SapOrder(
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
        orderStatus: OrderStatus.fromJson(json["orderStatus"]),
        orderType: OrderStatus.fromJson(json["orderType"]),
        deliveryStatus: json["deliveryStatus"],
        deliveryState: json["deliveryState"],
        deliveryCountry: json["deliveryCountry"],
        plant: json["plant"],
        truckSize: DeliveryMethod.fromJson(json["truckSize"]),
        delivery: Delivery.fromJson(json["delivery"]),
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
        "delivery": delivery!.toJson(),
        "deliveryMethod": deliveryMethod!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class Delivery {
  Delivery({
    this.id,
    this.deliveryDate,
    this.pickUpDate,
    this.loadingDate,
    this.transportDate,
    this.plannedGoodsMovementDate,
    this.trip,
  });

  int? id;
  DateTime? deliveryDate;
  DateTime? pickUpDate;
  DateTime? loadingDate;
  DateTime? transportDate;
  DateTime? plannedGoodsMovementDate;
  Trip? trip;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        pickUpDate: DateTime.parse(json["pickUpDate"]),
        loadingDate: DateTime.parse(json["loadingDate"]),
        transportDate: DateTime.parse(json["transportDate"]),
        plannedGoodsMovementDate:
            DateTime.parse(json["plannedGoodsMovementDate"]),
        trip: Trip.fromJson(json["trip"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryDate": deliveryDate!.toIso8601String(),
        "pickUpDate": pickUpDate!.toIso8601String(),
        "loadingDate": loadingDate!.toIso8601String(),
        "transportDate": transportDate!.toIso8601String(),
        "plannedGoodsMovementDate": plannedGoodsMovementDate!.toIso8601String(),
        "trip": trip!.toJson(),
      };
}

class Trip {
  Trip({
    this.id,
    this.trip,
  });

  int? id;
  OrderStatus? trip;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"],
        trip: OrderStatus.fromJson(json["trip"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip": trip!.toJson(),
      };
}

class OrderStatus {
  OrderStatus({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
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
  dynamic product;
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
        product: json["product"],
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
        "product": product,
        "salesUnitOfMeasure": salesUnitOfMeasure,
      };
}
