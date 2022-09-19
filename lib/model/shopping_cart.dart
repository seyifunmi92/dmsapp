class ShoppingCarts {
  int? shoppingCartId;
  int? userId;
  int? createdByUserId;
  String? dateCreated;
  int? modifiedByUserId;
  ShoppingCartStatus? shoppingCartStatus;
  String? dateModified;
  List<ShoppingCartItems>? shoppingCartItems;

  ShoppingCarts(
      {this.shoppingCartId,
        this.userId,
        this.createdByUserId,
        this.dateCreated,
        this.modifiedByUserId,
        this.shoppingCartStatus,
        this.dateModified,
        this.shoppingCartItems});

  ShoppingCarts.fromJson(Map<String, dynamic> json) {
    shoppingCartId = json['shoppingCartId'];
    userId = json['userId'];
    createdByUserId = json['createdByUserId'];
    dateCreated = json['dateCreated'];
    modifiedByUserId = json['modifiedByUserId'];
    shoppingCartStatus = json['shoppingCartStatus'] != null
        ? new ShoppingCartStatus.fromJson(json['shoppingCartStatus'])
        : null;
    dateModified = json['dateModified'];
    if (json['shoppingCartItems'] != null) {
      shoppingCartItems = <ShoppingCartItems>[];
      json['shoppingCartItems'].forEach((v) {
        shoppingCartItems!.add(new ShoppingCartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoppingCartId'] = this.shoppingCartId;
    data['userId'] = this.userId;
    data['createdByUserId'] = this.createdByUserId;
    data['dateCreated'] = this.dateCreated;
    data['modifiedByUserId'] = this.modifiedByUserId;
    if (this.shoppingCartStatus != null) {
      data['shoppingCartStatus'] = this.shoppingCartStatus!.toJson();
    }
    data['dateModified'] = this.dateModified;
    if (this.shoppingCartItems != null) {
      data['shoppingCartItems'] =
          this.shoppingCartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShoppingCartStatus {
  String? code;
  String? name;

  ShoppingCartStatus({this.code, this.name});

  ShoppingCartStatus.fromJson(Map<String, dynamic> json) {
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

class ShoppingCartItems {
  int? shoppingCartItemId;
  String? dateCreated;
  int? quantity;
  String? unitOfMeasureCode;
  Product? product;
  DistributorSapAccount? distributorSapAccount;

  ShoppingCartItems(
      {this.shoppingCartItemId,
        this.dateCreated,
        this.quantity,
        this.unitOfMeasureCode,
        this.product,
        this.distributorSapAccount});

  ShoppingCartItems.fromJson(Map<String, dynamic> json) {
    shoppingCartItemId = json['shoppingCartItemId'];
    dateCreated = json['dateCreated'];
    quantity = json['quantity'];
    unitOfMeasureCode = json['unitOfMeasureCode'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    distributorSapAccount = json['distributorSapAccount'] != null
        ? new DistributorSapAccount.fromJson(json['distributorSapAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoppingCartItemId'] = this.shoppingCartItemId;
    data['dateCreated'] = this.dateCreated;
    data['quantity'] = this.quantity;
    data['unitOfMeasureCode'] = this.unitOfMeasureCode;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.distributorSapAccount != null) {
      data['distributorSapAccount'] = this.distributorSapAccount!.toJson();
    }
    return data;
  }
}

class Product {
  int? productId;
  int? price;
  String? name;

  Product({this.productId, this.price, this.name});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    price = json['price'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['price'] = this.price;
    data['name'] = this.name;
    return data;
  }
}

class DistributorSapAccount {
  int? distributorSapAccountId;
  String? distributorSapNumber;
  String? distributorName;

  DistributorSapAccount(
      {this.distributorSapAccountId,
        this.distributorSapNumber,
        this.distributorName});

  DistributorSapAccount.fromJson(Map<String, dynamic> json) {
    distributorSapAccountId = json['distributorSapAccountId'];
    distributorSapNumber = json['distributorSapNumber'];
    distributorName = json['distributorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distributorSapAccountId'] = this.distributorSapAccountId;
    data['distributorSapNumber'] = this.distributorSapNumber;
    data['distributorName'] = this.distributorName;
    return data;
  }
}
