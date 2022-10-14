class Plant {
  int? plantId;
  String? companyCode;
  String? countryCode;
  String? name;
  PlantType? plantType;

  Plant(
      {this.plantId,
        this.companyCode,
        this.countryCode,
        this.name,
        this.plantType});

  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    companyCode = json['companyCode'];
    countryCode = json['countryCode'];
    name = json['name'];
    plantType = json['plantType'] != null
        ? new PlantType.fromJson(json['plantType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this.plantId;
    data['companyCode'] = this.companyCode;
    data['countryCode'] = this.countryCode;
    data['name'] = this.name;
    if (this.plantType != null) {
      data['plantType'] = this.plantType!.toJson();
    }
    return data;
  }
}

class PlantType {
  String? code;
  String? name;

  PlantType({this.code, this.name});

  PlantType.fromJson(Map<String, dynamic> json) {
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
