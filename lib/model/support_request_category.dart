class RequestCategory {
  int? categoryId;
  String? name;

  RequestCategory({this.categoryId, this.name});

  RequestCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    return data;
  }
}