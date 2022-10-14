class Profile {
  int? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? userName;
  int? numOfSapAccounts;
  String? dateCreated;
  String? profilePhotoPublicUrl;
  String? lastLoginDate;

  Profile(
      {this.userId,
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.phoneNumber,
        this.userName,
        this.numOfSapAccounts,
        this.dateCreated,
        this.profilePhotoPublicUrl,
        this.lastLoginDate});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    numOfSapAccounts = json['numOfSapAccounts'];
    dateCreated = json['dateCreated'];
    profilePhotoPublicUrl = json['profilePhotoPublicUrl'];
    lastLoginDate = json['lastLoginDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['userName'] = this.userName;
    data['numOfSapAccounts'] = this.numOfSapAccounts;
    data['dateCreated'] = this.dateCreated;
    data['profilePhotoPublicUrl'] = this.profilePhotoPublicUrl;
    data['lastLoginDate'] = this.lastLoginDate;
    return data;
  }
}
