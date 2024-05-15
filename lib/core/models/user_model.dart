class UserModel {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  DateTime? dob;
  String? mobileNumber;
  String? role;
  String? status;
  String? id;

  UserModel({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.dob,
    this.mobileNumber,
    this.role,
    this.status,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        dob: json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
        mobileNumber: json['mobileNumber'] as String?,
        role: json['role'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'DOB': dob?.toIso8601String(),
        'mobileNumber': mobileNumber,
        'role': role,
        'status': status,
        '_id': id,
      };
}
