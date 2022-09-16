// class Product {
//   int? productId;
//   String? name;
//   String? description;
//   String? productType;
//   String? unitOfMeasure;
//   String? primaryProductImageUrl;
//   String? productStatus;
//   String? dateModified;
//
//   Product(
//       {this.productId,
//         this.name,
//         this.description,
//         this.productType,
//         this.unitOfMeasure,
//         this.primaryProductImageUrl,
//         this.productStatus,
//         this.dateModified});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     productId = json['productId'];
//     name = json['name'];
//     description = json['description'];
//     productType = json['productType'];
//     unitOfMeasure = json['unitOfMeasure'];
//     primaryProductImageUrl = json['primaryProductImageUrl'];
//     productStatus = json['productStatus'];
//     dateModified = json['dateModified'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productId'] = this.productId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['productType'] = this.productType;
//     data['unitOfMeasure'] = this.unitOfMeasure;
//     data['primaryProductImageUrl'] = this.primaryProductImageUrl;
//     data['productStatus'] = this.productStatus;
//     data['dateModified'] = this.dateModified;
//     return data;
//   }
// }

class Product {
  int? productId;
  String? name;
  String? description;
  String? productType;
  String? unitOfMeasure;
  String? primaryProductImageUrl;
  ProductStatus? productStatus;
  String? dateModified;

  Product(
      {this.productId,
        this.name,
        this.description,
        this.productType,
        this.unitOfMeasure,
        this.primaryProductImageUrl,
        this.productStatus,
        this.dateModified});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    productType = json['productType'];
    unitOfMeasure = json['unitOfMeasure'];
    primaryProductImageUrl = json['primaryProductImageUrl'];
    productStatus = json['productStatus'] != null
        ? new ProductStatus.fromJson(json['productStatus'])
        : null;
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['productType'] = this.productType;
    data['unitOfMeasure'] = this.unitOfMeasure;
    data['primaryProductImageUrl'] = this.primaryProductImageUrl;
    if (this.productStatus != null) {
      data['productStatus'] = this.productStatus!.toJson();
    }
    data['dateModified'] = this.dateModified;
    return data;
  }
}

class ProductStatus {
  String? code;
  String? name;

  ProductStatus({this.code, this.name});

  ProductStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
