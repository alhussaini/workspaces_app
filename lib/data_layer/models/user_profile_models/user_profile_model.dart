class UserProfileModel {
  final bool successs;
  final User user;
  final List? userBooks;

  UserProfileModel(
      {this.userBooks, required this.successs, required this.user});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userBooks: json['userbooks'],
      successs: json['success'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String fullName;
  final String emailAddress;
  final String? contactNumber;
  final String? accountStatus;

  User(
      {required this.fullName,
      required this.emailAddress,
      required this.contactNumber,
      required this.accountStatus});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['full_name'],
      emailAddress: json['email_address'],
      contactNumber: json['contact_number'],
      accountStatus: json['account_status'],
    );
  }
}
