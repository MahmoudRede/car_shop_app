class UserModel {
  static const String collectionName = 'Users';

  String? userName;
  String? phoneNumber;
  String? email;
  String? uId;
  String? city;

  UserModel({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.uId,
    required this.city,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          phoneNumber: json['phoneNumber'],
          email: json['email'],
          uId: json['uId'],
          city: json['city'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
      'uId': uId,
      'city': city,
    };
  }
}
