class ProductItem {
  Product? product;

  ProductItem({this.product});

  ProductItem.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? productId;
  String? name;
  String? description;
  String? productType;
  double? price;
  String? productSapNumber;
  UnitOfMeasure? unitOfMeasure;
  UnitOfMeasure? productStatus;
  String? dateModified;
  List<ProductImages>? productImages;

  Product(
      {this.productId,
        this.name,
        this.description,
        this.productType,
        this.price,
        this.productSapNumber,
        this.unitOfMeasure,
        this.productStatus,
        this.dateModified,
        this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    productType = json['productType'];
    price = json['price'];
    productSapNumber = json['productSapNumber'];
    unitOfMeasure = json['unitOfMeasure'] != null
        ? new UnitOfMeasure.fromJson(json['unitOfMeasure'])
        : null;
    productStatus = json['productStatus'] != null
        ? new UnitOfMeasure.fromJson(json['productStatus'])
        : null;
    dateModified = json['dateModified'];
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['productType'] = this.productType;
    data['price'] = this.price;
    data['productSapNumber'] = this.productSapNumber;
    if (this.unitOfMeasure != null) {
      data['unitOfMeasure'] = this.unitOfMeasure!.toJson();
    }
    if (this.productStatus != null) {
      data['productStatus'] = this.productStatus!.toJson();
    }
    data['dateModified'] = this.dateModified;
    if (this.productImages != null) {
      data['productImages'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnitOfMeasure {
  String? code;
  String? name;

  UnitOfMeasure({this.code, this.name});

  UnitOfMeasure.fromJson(Map<String, dynamic> json) {
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

class ProductImages {
  String? publicUrl;
  bool? isPrimaryImage;

  ProductImages({this.publicUrl, this.isPrimaryImage});

  ProductImages.fromJson(Map<String, dynamic> json) {
    publicUrl = json['publicUrl'];
    isPrimaryImage = json['isPrimaryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicUrl'] = this.publicUrl;
    data['isPrimaryImage'] = this.isPrimaryImage;
    return data;
  }
}
