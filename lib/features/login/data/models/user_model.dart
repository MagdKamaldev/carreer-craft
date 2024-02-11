import 'dart:convert';

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? mobileNumber;
  String? role;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.mobileNumber,
    this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        dob: data['DOB'] as String?,
        mobileNumber: data['mobileNumber'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'DOB': dob,
        'mobileNumber': mobileNumber,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
