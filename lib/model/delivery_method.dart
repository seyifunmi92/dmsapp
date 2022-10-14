class DeliveryMethod {
  String? name;
  String? code;

  DeliveryMethod({this.name, this.code});

  DeliveryMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
