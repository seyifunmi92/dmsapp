class MyRequestItem {
  int? requestId;
  String? dateCreated;
  String? dateModified;
  RequestCategory? requestCategory;
  RequestStatus? requestStatus;
  String? subject;
  String? description;

  MyRequestItem(
      {this.requestId,
        this.dateCreated,
        this.dateModified,
        this.requestCategory,
        this.requestStatus,
        this.subject,
        this.description});

  MyRequestItem.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    dateCreated = json['dateCreated'];
    dateModified = json['dateModified'];
    requestCategory = json['requestCategory'] != null
        ? new RequestCategory.fromJson(json['requestCategory'])
        : null;
    requestStatus = json['requestStatus'] != null
        ? new RequestStatus.fromJson(json['requestStatus'])
        : null;
    subject = json['subject'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['dateCreated'] = this.dateCreated;
    data['dateModified'] = this.dateModified;
    if (this.requestCategory != null) {
      data['requestCategory'] = this.requestCategory!.toJson();
    }
    if (this.requestStatus != null) {
      data['requestStatus'] = this.requestStatus!.toJson();
    }
    data['subject'] = this.subject;
    data['description'] = this.description;
    return data;
  }
}

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

class RequestStatus {
  String? code;
  String? name;

  RequestStatus({this.code, this.name});

  RequestStatus.fromJson(Map<String, dynamic> json) {
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
