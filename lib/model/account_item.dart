// class AccountItem {
//   int? sapAccountId;
//   String? countryCode;
//   String? companyCode;
//   String? distributorSapNumber;
//   String? friendlyName;
//   String? dateCreated;
//   AccountType? accountType;
//
//   AccountItem(
//       {this.sapAccountId,
//         this.countryCode,
//         this.companyCode,
//         this.distributorSapNumber,
//         this.friendlyName,
//         this.dateCreated,
//         this.accountType});
//
//   AccountItem.fromJson(Map<String, dynamic> json) {
//     sapAccountId = json['sapAccountId'];
//     countryCode = json['countryCode'];
//     companyCode = json['companyCode'];
//     distributorSapNumber = json['distributorSapNumber'];
//     friendlyName = json['friendlyName'];
//     dateCreated = json['dateCreated'];
//     accountType = json['accountType'] != null
//         ? new AccountType.fromJson(json['accountType'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sapAccountId'] = this.sapAccountId;
//     data['countryCode'] = this.countryCode;
//     data['companyCode'] = this.companyCode;
//     data['distributorSapNumber'] = this.distributorSapNumber;
//     data['friendlyName'] = this.friendlyName;
//     data['dateCreated'] = this.dateCreated;
//     if (this.accountType != null) {
//       data['accountType'] = this.accountType!.toJson();
//     }
//     return data;
//   }
// }
//
// class AccountType {
//   String? name;
//   String? code;
//
//   AccountType({this.name, this.code});
//
//   AccountType.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     code = json['code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['code'] = this.code;
//     return data;
//   }
// }


class AccountItem {
  int? sapAccountId;
  String? countryCode;
  String? companyCode;
  String? distributorSapNumber;
  String? distributorName;
  String? friendlyName;
  String? dateCreated;
  AccountType? accountType;

  AccountItem(
      {this.sapAccountId,
        this.countryCode,
        this.companyCode,
        this.distributorSapNumber,
        this.distributorName,
        this.friendlyName,
        this.dateCreated,
        this.accountType});

  AccountItem.fromJson(Map<String, dynamic> json) {
    sapAccountId = json['sapAccountId'];
    countryCode = json['countryCode'];
    companyCode = json['companyCode'];
    distributorSapNumber = json['distributorSapNumber'];
    distributorName = json['distributorName'];
    friendlyName = json['friendlyName'];
    dateCreated = json['dateCreated'];
    accountType = json['accountType'] != null
        ? new AccountType.fromJson(json['accountType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sapAccountId'] = this.sapAccountId;
    data['countryCode'] = this.countryCode;
    data['companyCode'] = this.companyCode;
    data['distributorSapNumber'] = this.distributorSapNumber;
    data['distributorName'] = this.distributorName;
    data['friendlyName'] = this.friendlyName;
    data['dateCreated'] = this.dateCreated;
    if (this.accountType != null) {
      data['accountType'] = this.accountType!.toJson();
    }
    return data;
  }
}

class AccountType {
  String? name;
  String? code;

  AccountType({this.name, this.code});

  AccountType.fromJson(Map<String, dynamic> json) {
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
