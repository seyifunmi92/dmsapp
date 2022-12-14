class CartItem {
  int? shoppingCartItemId;
  String? dateCreated;
  double? quantity;
  String? unitOfMeasureCode;
  Product? product;
  DistributorSapAccount? distributorSapAccount;

  CartItem(
      {this.shoppingCartItemId,
        this.dateCreated,
        this.quantity,
        this.unitOfMeasureCode,
        this.product,
        this.distributorSapAccount});

  CartItem.fromJson(Map<String, dynamic> json) {
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
