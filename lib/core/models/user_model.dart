class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  DateTime? dob;
  String? mobileNumber;
  String? role;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? passwordChangedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.dob,
    this.mobileNumber,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.passwordChangedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        dob: json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
        mobileNumber: json['mobileNumber'] as String?,
        role: json['role'] as String?,
        status: json['status'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        passwordChangedAt: json['passwordChangedAt'] == null
            ? null
            : DateTime.parse(json['passwordChangedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'DOB': dob?.toIso8601String(),
        'mobileNumber': mobileNumber,
        'role': role,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'passwordChangedAt': passwordChangedAt?.toIso8601String(),
      };
}
