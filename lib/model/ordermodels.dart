import 'package:flutter/material.dart';

import 'dart:convert';

class GetDmsOrdersX {
  GetDmsOrdersX({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  DataT? data;
  String? status;
  String? statusCode;
  String? message;

  factory GetDmsOrdersX.fromJson(Map<String, dynamic> json) => GetDmsOrdersX(
        data: DataT.fromJson(json["data"]),
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

class DataT {
  DataT({
    this.pagination,
    this.dmsOrders,
  });

  Pagination? pagination;
  List<DmsOrder>? dmsOrders;

  factory DataT.fromJson(Map<String, dynamic> json) => DataT(
        pagination: Pagination.fromJson(json["pagination"]),
        dmsOrders: List<DmsOrder>.from(
            json["dmsOrders"].map((x) => DmsOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "dmsOrders": List<dynamic>.from(dmsOrders!.map((x) => x.toJson())),
      };
}

class DmsOrder {
  DmsOrder({
    this.dmsorderId,
    this.dateCreated,
    this.companyCode,
    this.countryCode,
    this.orderStatus,
    this.orderType,
    this.isAtc,
    this.estimatedNetvalue,
    this.orderSapNetValue,
  });

  int? dmsorderId;
  DateTime? dateCreated;
  String? companyCode;
  String? countryCode;
  Order? orderStatus;
  Order? orderType;
  bool? isAtc;
  double? estimatedNetvalue;
  dynamic orderSapNetValue;

  factory DmsOrder.fromJson(Map<String, dynamic> json) => DmsOrder(
        dmsorderId: json["dmsorderId"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        companyCode: json["companyCode"],
        countryCode: json["countryCode"],
        orderStatus: Order.fromJson(json["orderStatus"]),
        orderType: Order.fromJson(json["orderType"]),
        isAtc: json["isATC"],
        estimatedNetvalue: json["estimatedNetvalue"],
        orderSapNetValue: json["orderSapNetValue"],
      );

  Map<String, dynamic> toJson() => {
        "dmsorderId": dmsorderId,
        "dateCreated": dateCreated!.toIso8601String(),
        "companyCode": companyCode,
        "countryCode": countryCode,
        "orderStatus": orderStatus!.toJson(),
        "orderType": orderType!.toJson(),
        "isATC": isAtc,
        "estimatedNetvalue": estimatedNetvalue,
        "orderSapNetValue": orderSapNetValue,
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

class Pagination {
  Pagination({
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
  });

  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
      };
}

class GetDmsOrders {
  GetDmsOrders({
    this.data,
    this.statusCode,
    this.status,
    this.message,
  });

  Data? data;
  String? statusCode;
  String? status;
  String? message;

  factory GetDmsOrders.fromJson(Map<String, dynamic> json) => GetDmsOrders(
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
    this.id,
    this.dateCreated,
    this.companyCode,
    this.countryCode,
    this.orderStatus,
    this.orderType,
    this.deliveryStatus,
    this.isAtc,
    this.estimatedNetValue,
    this.orderSapNetValue,
    this.numItems,
  });

  int? id;
  DateTime? dateCreated;
  String? companyCode;
  String? countryCode;
  DeliveryStatus? orderStatus;
  DeliveryStatus? orderType;
  DeliveryStatus? deliveryStatus;
  bool? isAtc;
  int? estimatedNetValue;
  int? orderSapNetValue;
  int? numItems;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        companyCode: json["companyCode"],
        countryCode: json["countryCode"],
        orderStatus: DeliveryStatus.fromJson(json["orderStatus"]),
        orderType: DeliveryStatus.fromJson(json["orderType"]),
        deliveryStatus: DeliveryStatus.fromJson(json["deliveryStatus"]),
        isAtc: json["isAtc"],
        estimatedNetValue: json["estimatedNetValue"],
        orderSapNetValue: json["orderSapNetValue"],
        numItems: json["numItems"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "companyCode": companyCode,
        "countryCode": countryCode,
        "orderStatus": orderStatus!.toJson(),
        "orderType": orderType!.toJson(),
        "deliveryStatus": deliveryStatus!.toJson(),
        "isAtc": isAtc,
        "estimatedNetValue": estimatedNetValue,
        "orderSapNetValue": orderSapNetValue,
        "numItems": numItems,
      };
}

class DeliveryStatus {
  DeliveryStatus({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) => DeliveryStatus(
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

class GetSapOrders {
  GetSapOrders({
    this.datab,
    this.statusCode,
    this.status,
    this.message,
  });

  Datab? datab;
  String? statusCode;
  String? status;
  String? message;

  factory GetSapOrders.fromJson(Map<String, dynamic> json) => GetSapOrders(
        datab: Datab.fromJson(json["datab"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "datab": datab!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Datab {
  Datab({
    this.items,
    this.pagination,
  });

  List<Item>? items;
  Pagination? pagination;

  factory Datab.fromJson(Map<String, dynamic> json) => Datab(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class Item {
  Item({
    this.id,
    this.estimateNetValue,
    this.dateCreated,
    this.numItems,
    this.orderStatus,
    this.orderType,
  });

  int? id;
  int? estimateNetValue;
  DateTime? dateCreated;
  int? numItems;
  Order? orderStatus;
  Order? orderType;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        estimateNetValue: json["estimateNetValue"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        numItems: json["numItems"],
        orderStatus: Order.fromJson(json["orderStatus"]),
        orderType: Order.fromJson(json["orderType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estimateNetValue": estimateNetValue,
        "dateCreated": dateCreated!.toIso8601String(),
        "numItems": numItems,
        "orderStatus": orderStatus!.toJson(),
        "orderType": orderType!.toJson(),
      };
}

class Order9 {
  Order9({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory Order9.fromJson(Map<String, dynamic> json) => Order9(
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

class Pagination9 {
  Pagination9({
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
  });

  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;

  factory Pagination9.fromJson(Map<String, dynamic> json) => Pagination9(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
      };
}

class Getthedms {
  Getthedms({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  Data? data;
  String? status;
  String? statusCode;
  String? message;

  factory Getthedms.fromJson(Map<String, dynamic> json) => Getthedms(
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

class DataDms {
  DataDms({
    this.dmsOrder,
  });

  DmsOrder9? dmsOrder;

  factory DataDms.fromJson(Map<String, dynamic> json) => DataDms(
        dmsOrder: DmsOrder9.fromJson(json["dmsOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "dmsOrder": dmsOrder!.toJson(),
      };
}

class DmsOrder9 {
  DmsOrder9({
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
    this.plant,
    this.truckSize,
    this.deliveryMethod,
    this.orderItems,
  });

  int? id;
  DateTime? dateCreated;
  dynamic? orderSapNumber;
  dynamic? parentOrderSapNumber;
  bool? isAtc;
  String? companyCode;
  String? countryCode;
  int? distributorSapAccountId;
  int? orderStatusId;
  int? orderTypeId;
  int? shoppingCartId;
  double? estimatedNetValue;
  dynamic orderSapNetValue;
  DateTime? deliveryDate;
  String? deliveryAddress;
  dynamic truckSizeCode;
  String? deliveryCity;
  dynamic plantCode;
  dynamic sapVat;
  dynamic sapFreightCharges;
  DistributorSapAccount9? distributorSapAccount;
  Order? orderStatus;
  Order? orderType;
  dynamic deliveryStatus;
  dynamic plant;
  DeliveryMethod9? truckSize;
  DeliveryMethod9? deliveryMethod;
  List<OrderItem9>? orderItems;

  factory DmsOrder9.fromJson(Map<String, dynamic> json) => DmsOrder9(
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
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.parse(json["deliveryDate"]),
        deliveryAddress: json["deliveryAddress"],
        truckSizeCode: json["truckSizeCode"],
        deliveryCity: json["deliveryCity"],
        plantCode: json["plantCode"],
        sapVat: json["sapVat"],
        sapFreightCharges: json["sapFreightCharges"],
        distributorSapAccount:
            DistributorSapAccount9.fromJson(json["distributorSapAccount"]),
        orderStatus: Order.fromJson(json["orderStatus"]),
        orderType: Order.fromJson(json["orderType"]),
        deliveryStatus: json["deliveryStatus"],
        plant: json["plant"],
        truckSize: DeliveryMethod9.fromJson(json["truckSize"]),
        deliveryMethod: DeliveryMethod9.fromJson(json["deliveryMethod"]),
        orderItems: List<OrderItem9>.from(
            json["orderItems"].map((x) => OrderItem9.fromJson(x))),
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
        "plant": plant,
        "truckSize": truckSize!.toJson(),
        "deliveryMethod": deliveryMethod!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class DeliveryMethod9 {
  DeliveryMethod9({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DeliveryMethod9.fromJson(Map<String, dynamic> json) =>
      DeliveryMethod9(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class DistributorSapAccount9 {
  DistributorSapAccount9({
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

  factory DistributorSapAccount9.fromJson(Map<String, dynamic> json) =>
      DistributorSapAccount9(
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

class OrderItem9 {
  OrderItem9({
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

  factory OrderItem9.fromJson(Map<String, dynamic> json) => OrderItem9(
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

class OrderZ {
  OrderZ({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory OrderZ.fromJson(Map<String, dynamic> json) => OrderZ(
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

class GetSapOrderDetails {
  GetSapOrderDetails({
    this.datad,
    this.statusCode,
    this.status,
    this.message,
  });

  Datad? datad;
  String? statusCode;
  String? status;
  String? message;

  factory GetSapOrderDetails.fromJson(Map<String, dynamic> json) =>
      GetSapOrderDetails(
        datad: Datad.fromJson(json["data"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": datad!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Datad {
  Datad({
    this.sapOrder,
  });

  SapOrder? sapOrder;

  factory Datad.fromJson(Map<String, dynamic> json) => Datad(
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
    this.parentId,
    this.orderType,
    this.deliveryStatus,
    this.orderStatus,
    this.deliveryBlock,
    this.estimatedNetValue,
    this.orderSapNetValue,
    this.deliveryDate,
    this.deliveryAddress,
    this.deliveryCity,
    this.plantCode,
    this.truckSize,
    this.sapFreightCharges,
    this.reference,
    this.sapVat,
    this.orderItems,
  });

  int? id;
  DateTime? dateCreated;
  String? orderSapNumber;
  String? parentId;
  DeliveryStatus? orderType;
  DeliveryStatus? deliveryStatus;
  DeliveryStatus? orderStatus;
  DeliveryBlock? deliveryBlock;
  int? estimatedNetValue;
  int? orderSapNetValue;
  DateTime? deliveryDate;
  String? deliveryAddress;
  String? deliveryCity;
  String? plantCode;
  DeliveryBlock? truckSize;
  int? sapFreightCharges;
  String? reference;
  int? sapVat;
  List<OrderItem2>? orderItems;

  factory SapOrder.fromJson(Map<String, dynamic> json) => SapOrder(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        orderSapNumber: json["orderSapNumber"],
        parentId: json["parentId"],
        orderType: DeliveryStatus.fromJson(json["orderType"]),
        deliveryStatus: (json["deliveryStatus"]) == null
            ? null
            : DeliveryStatus.fromJson(json["deliveryStatus"]),
        orderStatus: (json["orderStatus"]) == null
            ? null
            : DeliveryStatus.fromJson(json["orderStatus"]),
        deliveryBlock: (json["deliveryBlock"]) == null
            ? null
            : DeliveryBlock.fromJson(json["deliveryBlock"]),
        estimatedNetValue: json["estimatedNetValue"],
        orderSapNetValue: json["orderSapNetValue"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        deliveryAddress: json["deliveryAddress"],
        deliveryCity: json["deliveryCity"],
        plantCode: (json["plantCode"]) == null ? null : json["plantCode"],
        truckSize: DeliveryBlock.fromJson(json["truckSize"]),
        sapFreightCharges: json["sapFreightCharges"],
        reference: json["reference"],
        sapVat: json["sapVat"],
        orderItems: List<OrderItem2>.from(
            json["orderItems"].map((x) => OrderItem2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "orderSapNumber": orderSapNumber,
        "parentId": parentId,
        "orderType": orderType!.toJson(),
        "deliveryStatus": deliveryStatus!.toJson(),
        "orderStatus": orderStatus!.toJson(),
        "deliveryBlock": deliveryBlock!.toJson(),
        "estimatedNetValue": estimatedNetValue,
        "orderSapNetValue": orderSapNetValue,
        "deliveryDate": deliveryDate!.toIso8601String(),
        "deliveryAddress": deliveryAddress,
        "deliveryCity": deliveryCity,
        "plantCode": plantCode,
        "truckSize": truckSize!.toJson(),
        "sapFreightCharges": sapFreightCharges,
        "reference": reference,
        "sapVat": sapVat,
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class DeliveryBlock {
  DeliveryBlock({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DeliveryBlock.fromJson(Map<String, dynamic> json) => DeliveryBlock(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class DeliveryStatusc {
  DeliveryStatusc({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory DeliveryStatusc.fromJson(Map<String, dynamic> json) =>
      DeliveryStatusc(
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

class OrderItem2 {
  OrderItem2({
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
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateModified;
  int? orderId;
  int? userId;
  String? orderItemSapNumber;
  double? quantity;
  String? salesUnitOfMeasureCode;
  int? productId;
  int? sapPricePerUnit;
  int? sapNetValue;
  int? sapDeliveryQuality;

  factory OrderItem2.fromJson(Map<String, dynamic> json) => OrderItem2(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: (json["dateModified"]) == null
            ? null
            : DateTime.parse(json["dateModified"]),
        orderId: json["orderId"],
        userId: json["userId"],
        orderItemSapNumber: json["orderItemSapNumber"],
        quantity: json["quantity"],
        salesUnitOfMeasureCode: json["salesUnitOfMeasureCode"],
        productId: json["productId"],
        sapPricePerUnit: json["sapPricePerUnit"],
        sapNetValue: json["sapNetValue"],
        sapDeliveryQuality: json["sapDeliveryQuality"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified!.toIso8601String(),
        "orderId": orderId,
        "userId": userId,
        "orderItemSapNumber": orderItemSapNumber,
        "quantity": quantity,
        "salesUnitOfMeasureCode": salesUnitOfMeasureCode,
        "productId": productId,
        "sapPricePerUnit": sapPricePerUnit,
        "sapNetValue": sapNetValue,
        "sapDeliveryQuality": sapDeliveryQuality,
      };
}

class SubmitDmsOrder {
  SubmitDmsOrder({
    this.data2,
    this.statusCode,
    this.status,
    this.message,
  });

  Data2? data2;
  String? statusCode;
  String? status;
  String? message;

  factory SubmitDmsOrder.fromJson(Map<String, dynamic> json) => SubmitDmsOrder(
        data2: Data2.fromJson(json["data2"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data2": data2!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Data2 {
  Data2({
    this.otp,
  });
  Otp? otp;
  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
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

class CancelDmSorder {
  CancelDmSorder({
    this.data3,
    this.status,
    this.statusCode,
    this.message,
  });

  String? data3;
  String? status;
  String? statusCode;
  String? message;

  factory CancelDmSorder.fromJson(Map<String, dynamic> json) => CancelDmSorder(
        data3: json["data3"],
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data3,
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}

class UpdateDmSorder {
  UpdateDmSorder({
    this.data4,
    this.statusCode,
    this.status,
    this.message,
  });

  Data4? data4;
  String? statusCode;
  String? status;
  String? message;

  factory UpdateDmSorder.fromJson(Map<String, dynamic> json) => UpdateDmSorder(
        data4: Data4.fromJson(json["data4"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data4": data4!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Data4 {
  Data4({
    this.sapOrder2,
  });

  SapOrder2? sapOrder2;

  factory Data4.fromJson(Map<String, dynamic> json) => Data4(
        sapOrder2: SapOrder2.fromJson(json["sapOrder2"]),
      );

  Map<String, dynamic> toJson() => {
        "sapOrder2": sapOrder2!.toJson(),
      };
}

class SapOrder2 {
  SapOrder2({
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
    this.plant,
    this.truckSize,
    this.deliveryMethod,
    this.orderItems,
  });

  int? id;
  DateTime? dateCreated;
  String? orderSapNumber;
  String? parentOrderSapNumber;
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
  String? truckSizeCode;
  String? deliveryCity;
  String? plantCode;
  int? sapVat;
  int? sapFreightCharges;
  DistributorSapAccount2? distributorSapAccount;
  DeliveryStatus? orderStatus;
  DeliveryStatus? orderType;
  DeliveryStatus? deliveryStatus;
  DeliveryStatus? plant;
  DeliveryMethod2? truckSize;
  DeliveryMethod2? deliveryMethod;
  List<OrderItem3>? orderItems;

  factory SapOrder2.fromJson(Map<String, dynamic> json) => SapOrder2(
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
            DistributorSapAccount2.fromJson(json["distributorSapAccount"]),
        orderStatus: DeliveryStatus.fromJson(json["orderStatus"]),
        orderType: DeliveryStatus.fromJson(json["orderType"]),
        deliveryStatus: DeliveryStatus.fromJson(json["deliveryStatus"]),
        plant: DeliveryStatus.fromJson(json["plant"]),
        truckSize: DeliveryMethod2.fromJson(json["truckSize"]),
        deliveryMethod: DeliveryMethod2.fromJson(json["deliveryMethod"]),
        orderItems: List<OrderItem3>.from(
            json["orderItems"].map((x) => OrderItem3.fromJson(x))),
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
        "deliveryStatus": deliveryStatus!.toJson(),
        "plant": plant!.toJson(),
        "truckSize": truckSize!.toJson(),
        "deliveryMethod": deliveryMethod!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class DeliveryMethod2 {
  DeliveryMethod2({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DeliveryMethod2.fromJson(Map<String, dynamic> json) =>
      DeliveryMethod2(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class DeliveryStatus3 {
  DeliveryStatus3({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory DeliveryStatus3.fromJson(Map<String, dynamic> json) =>
      DeliveryStatus3(
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

class DistributorSapAccount2 {
  DistributorSapAccount2({
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
  String? companyCode;
  String? countryCode;
  String? accountType;

  factory DistributorSapAccount2.fromJson(Map<String, dynamic> json) =>
      DistributorSapAccount2(
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

class OrderItem3 {
  OrderItem3({
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
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateModified;
  int? orderId;
  int? userId;
  String? orderItemSapNumber;
  int? quantity;
  String? salesUnitOfMeasureCode;
  int? productId;
  int? sapPricePerUnit;
  int? sapNetValue;
  int? sapDeliveryQuality;

  factory OrderItem3.fromJson(Map<String, dynamic> json) => OrderItem3(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
        orderId: json["orderId"],
        userId: json["userId"],
        orderItemSapNumber: json["orderItemSapNumber"],
        quantity: json["quantity"],
        salesUnitOfMeasureCode: json["salesUnitOfMeasureCode"],
        productId: json["productId"],
        sapPricePerUnit: json["sapPricePerUnit"],
        sapNetValue: json["sapNetValue"],
        sapDeliveryQuality: json["sapDeliveryQuality"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified!.toIso8601String(),
        "orderId": orderId,
        "userId": userId,
        "orderItemSapNumber": orderItemSapNumber,
        "quantity": quantity,
        "salesUnitOfMeasureCode": salesUnitOfMeasureCode,
        "productId": productId,
        "sapPricePerUnit": sapPricePerUnit,
        "sapNetValue": sapNetValue,
        "sapDeliveryQuality": sapDeliveryQuality,
      };
}

class CartCheckout {
  CartCheckout({
    this.data5,
    this.statusCode,
    this.status,
    this.message,
  });

  Data5? data5;
  String? statusCode;
  String? status;
  String? message;

  factory CartCheckout.fromJson(Map<String, dynamic> json) => CartCheckout(
        data5: Data5.fromJson(json["data"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data5": data5!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class Data5 {
  Data5({
    this.dmsOrder,
  });

  DmsOrder? dmsOrder;

  factory Data5.fromJson(Map<String, dynamic> json) => Data5(
        dmsOrder: DmsOrder.fromJson(json["dmsOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "dmsOrder": dmsOrder!.toJson(),
      };
}

class DmsOrderY {
  DmsOrderY({
    this.dmsOrderId,
  });

  int? dmsOrderId;

  factory DmsOrderY.fromJson(Map<String, dynamic> json) => DmsOrderY(
        dmsOrderId: json["dmsOrderId"],
      );

  Map<String, dynamic> toJson() => {
        "dmsOrderId": dmsOrderId,
      };
}

class CancelOrder {
  CancelOrder({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  String? data;
  String? status;
  String? statusCode;
  String? message;

  factory CancelOrder.fromJson(Map<String, dynamic> json) => CancelOrder(
        data: json["data"],
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}

class RecentDmsOrders {
  RecentDmsOrders({
    this.datarecent,
    this.statusCode,
    this.status,
    this.message,
  });

  DataRecent? datarecent;
  String? statusCode;
  String? status;
  String? message;

  factory RecentDmsOrders.fromJson(Map<String, dynamic> json) =>
      RecentDmsOrders(
        datarecent: (json["datarecent"]) == null
            ? null
            : DataRecent.fromJson(json["datarecent"]),
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "datarecent": datarecent!.toJson(),
        "statusCode": statusCode,
        "status": status,
        "message": message,
      };
}

class DataRecent {
  DataRecent({
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
    this.plant,
    this.truckSize,
    this.deliveryMethod,
    this.orderItems,
  });

  int? id;
  DateTime? dateCreated;
  String? orderSapNumber;
  String? parentOrderSapNumber;
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
  String? truckSizeCode;
  String? deliveryCity;
  String? plantCode;
  int? sapVat;
  int? sapFreightCharges;
  DistributorSapAccountR? distributorSapAccount;
  DeliveryStatus? orderStatus;
  DeliveryStatus? orderType;
  DeliveryStatus? deliveryStatus;
  DeliveryStatus? plant;
  DeliveryMethod3? truckSize;
  DeliveryMethod3? deliveryMethod;
  List<OrderItemR>? orderItems;

  factory DataRecent.fromJson(Map<String, dynamic> json) => DataRecent(
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
            DistributorSapAccountR.fromJson(json["distributorSapAccount"]),
        orderStatus: DeliveryStatus.fromJson(json["orderStatus"]),
        orderType: DeliveryStatus.fromJson(json["orderType"]),
        deliveryStatus: DeliveryStatus.fromJson(json["deliveryStatus"]),
        plant: DeliveryStatus.fromJson(json["plant"]),
        truckSize: DeliveryMethod3.fromJson(json["truckSize"]),
        deliveryMethod: DeliveryMethod3.fromJson(json["deliveryMethod"]),
        orderItems: List<OrderItemR>.from(
            json["orderItems"].map((x) => OrderItemR.fromJson(x))),
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
        "deliveryStatus": deliveryStatus!.toJson(),
        "plant": plant!.toJson(),
        "truckSize": truckSize!.toJson(),
        "deliveryMethod": deliveryMethod!.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class DeliveryMethod3 {
  DeliveryMethod3({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory DeliveryMethod3.fromJson(Map<String, dynamic> json) =>
      DeliveryMethod3(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class DeliveryStatusR {
  DeliveryStatusR({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory DeliveryStatusR.fromJson(Map<String, dynamic> json) =>
      DeliveryStatusR(
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

class DistributorSapAccountR {
  DistributorSapAccountR({
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
  String? companyCode;
  String? countryCode;
  String? accountType;

  factory DistributorSapAccountR.fromJson(Map<String, dynamic> json) =>
      DistributorSapAccountR(
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

class OrderItemR {
  OrderItemR({
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
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateModified;
  int? orderId;
  int? userId;
  String? orderItemSapNumber;
  double? quantity;
  String? salesUnitOfMeasureCode;
  int? productId;
  int? sapPricePerUnit;
  int? sapNetValue;
  int? sapDeliveryQuality;

  factory OrderItemR.fromJson(Map<String, dynamic> json) => OrderItemR(
        id: json["id"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: (json["dateModified"]) == null
            ? null
            : DateTime.parse(json["dateModified"]),
        orderId: json["orderId"],
        userId: json["userId"],
        orderItemSapNumber: json["orderItemSapNumber"],
        quantity: json["quantity"],
        salesUnitOfMeasureCode: json["salesUnitOfMeasureCode"],
        productId: json["productId"],
        sapPricePerUnit: json["sapPricePerUnit"],
        sapNetValue: json["sapNetValue"],
        sapDeliveryQuality: json["sapDeliveryQuality"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified!.toIso8601String(),
        "orderId": orderId,
        "userId": userId,
        "orderItemSapNumber": orderItemSapNumber,
        "quantity": quantity,
        "salesUnitOfMeasureCode": salesUnitOfMeasureCode,
        "productId": productId,
        "sapPricePerUnit": sapPricePerUnit,
        "sapNetValue": sapNetValue,
        "sapDeliveryQuality": sapDeliveryQuality,
      };
}

class ScheduleDmsDelivery {
  ScheduleDmsDelivery({
    this.data,
    this.statusCode,
    this.status,
    this.message,
  });

  DataSchedule? data;
  String? statusCode;
  String? status;
  String? message;

  factory ScheduleDmsDelivery.fromJson(Map<String, dynamic> json) =>
      ScheduleDmsDelivery(
        data: DataSchedule.fromJson(json["data"]),
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

class DataSchedule {
  DataSchedule({
    this.otp,
  });

  Otp? otp;

  factory DataSchedule.fromJson(Map<String, dynamic> json) => DataSchedule(
        otp: Otp.fromJson(json["otp"]),
      );

  Map<String, dynamic> toJson() => {
        "otp": otp!.toJson(),
      };
}

class OtpSchedule {
  OtpSchedule({
    this.otpId,
  });

  int? otpId;

  factory OtpSchedule.fromJson(Map<String, dynamic> json) => OtpSchedule(
        otpId: json["otpId"],
      );

  Map<String, dynamic> toJson() => {
        "otpId": otpId,
      };
}

class ValidateOtp {
  ValidateOtp({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  String? data;
  String? status;
  String? statusCode;
  String? message;

  factory ValidateOtp.fromJson(Map<String, dynamic> json) => ValidateOtp(
        data: json["data"],
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}

class ResendOtp {
  ResendOtp({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  String? data;
  String? status;
  String? statusCode;
  String? message;

  factory ResendOtp.fromJson(Map<String, dynamic> json) => ResendOtp(
        data: json["data"],
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}

class GetSapAcct {
  GetSapAcct({
    this.data,
    this.statusCode,
    this.status,
    this.message,
  });

  DataY? data;
  String? statusCode;
  String? status;
  String? message;

  factory GetSapAcct.fromJson(Map<String, dynamic> json) => GetSapAcct(
        data: DataY.fromJson(json["data"]),
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

class DataY {
  DataY({
    this.items,
    this.pagination,
  });

  List<ItemY>? items;
  Pagination? pagination;

  factory DataY.fromJson(Map<String, dynamic> json) => DataY(
        items: List<ItemY>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class ItemY {
  ItemY({
    this.sapAccountId,
    this.countryCode,
    this.companyCode,
    this.distributorSapNumber,
    this.friendlyName,
    this.dateCreated,
    this.accountType,
  });

  int? sapAccountId;
  String? countryCode;
  String? companyCode;
  String? distributorSapNumber;
  String? friendlyName;
  DateTime? dateCreated;
  AccountType? accountType;

  factory ItemY.fromJson(Map<String, dynamic> json) => ItemY(
        sapAccountId: json["sapAccountId"],
        countryCode: json["countryCode"],
        companyCode: json["companyCode"],
        distributorSapNumber: json["distributorSapNumber"],
        friendlyName: json["friendlyName"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        accountType: AccountType.fromJson(json["accountType"]),
      );

  Map<String, dynamic> toJson() => {
        "sapAccountId": sapAccountId,
        "countryCode": countryCode,
        "companyCode": companyCode,
        "distributorSapNumber": distributorSapNumber,
        "friendlyName": friendlyName,
        "dateCreated": dateCreated!.toIso8601String(),
        "accountType": accountType!.toJson(),
      };
}

class AccountType {
  AccountType({
    this.name,
    this.code,
  });

  String? name;
  String? code;

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class PaginationY {
  PaginationY({
    this.pageIndex,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
  });

  int? pageIndex;
  int? pageSize;
  int? totalPages;
  int? totalRecords;

  factory PaginationY.fromJson(Map<String, dynamic> json) => PaginationY(
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

class AtcOrder {
  AtcOrder({
    this.data,
    this.status,
    this.statusCode,
    this.message,
  });

  DataATC? data;
  String? status;
  String? statusCode;
  String? message;

  factory AtcOrder.fromJson(Map<String, dynamic> json) => AtcOrder(
        data: DataATC.fromJson(json["data"]),
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

class DataATC {
  DataATC({
    this.items,
    this.pagination,
  });

  List<Item>? items;
  Pagination? pagination;

  factory DataATC.fromJson(Map<String, dynamic> json) => DataATC(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class ItemATC {
  ItemATC({
    this.dmsorderId,
    this.dateCreated,
    this.parentId,
    this.distributorNumber,
    this.orderStatus,
    this.orderType,
    this.isAtc,
    this.estimatedNetvalue,
  });

  int? dmsorderId;
  DateTime? dateCreated;
  dynamic? parentId;
  String? distributorNumber;
  Order? orderStatus;
  Order? orderType;
  bool? isAtc;
  double? estimatedNetvalue;

  factory ItemATC.fromJson(Map<String, dynamic> json) => ItemATC(
        dmsorderId: json["dmsorderId"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        parentId: json["parentId"],
        distributorNumber: json["distributorNumber"],
        orderStatus: Order.fromJson(json["orderStatus"]),
        orderType: Order.fromJson(json["orderType"]),
        isAtc: json["isATC"],
        estimatedNetvalue: json["estimatedNetvalue"],
      );

  Map<String, dynamic> toJson() => {
        "dmsorderId": dmsorderId,
        "dateCreated": dateCreated!.toIso8601String(),
        "parentId": parentId,
        "distributorNumber": distributorNumber,
        "orderStatus": orderStatus!.toJson(),
        "orderType": orderType!.toJson(),
        "isATC": isAtc,
        "estimatedNetvalue": estimatedNetvalue,
      };
}

class OrderATC {
  OrderATC({
    this.id,
    this.code,
    this.name,
  });

  int? id;
  String? code;
  String? name;

  factory OrderATC.fromJson(Map<String, dynamic> json) => OrderATC(
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

class PaginationATC {
  PaginationATC({
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
  });

  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;

  factory PaginationATC.fromJson(Map<String, dynamic> json) => PaginationATC(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
      };
}

class Otp1 {
  Otp1({
    this.otpId,
    this.otpCode,
  });

  int? otpId;
  String? otpCode;

  factory Otp1.fromJson(Map<String, dynamic> json) => Otp1(
        otpId: json["otpId"],
        otpCode: json["otpCode"],
      );

  Map<String, dynamic> toJson() => {
        "otpId": otpId,
        "otpCode": otpCode,
      };
}

class Otp2 {
  Otp2({
    this.otpId,
    this.otpCode,
  });

  int? otpId;
  String? otpCode;

  factory Otp2.fromJson(Map<String, dynamic> json) => Otp2(
        otpId: json["otpId"],
        otpCode: json["otpCode"],
      );

  Map<String, dynamic> toJson() => {
        "otpId": otpId,
        "otpCode": otpCode,
      };
}

class TotalyPrice {
  TotalyPrice({
    this.totalPrice,
  });

  double? totalPrice;

  factory TotalyPrice.fromJson(Map<double, dynamic> json) => TotalyPrice(
        totalPrice: json["totalPrice"],
      );

  Map<double, dynamic> toJson() => {
        totalPrice!: totalPrice,
      };
}

class TotalyQuantity {
  TotalyQuantity({
    this.totalQuantity,
  });

  double? totalQuantity;

  factory TotalyQuantity.fromJson(Map<double, dynamic> json) => TotalyQuantity(
        totalQuantity: json["totalPrice"],
      );

  Map<double, dynamic> toJson() => {
        totalQuantity!: totalQuantity,
      };
}
