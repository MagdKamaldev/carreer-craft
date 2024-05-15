class UserModel {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;
  DateTime? dob;
  String? mobileNumber;
  String? role;
  String? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserModel({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.dob,
    this.mobileNumber,
    this.role,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        dob: json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
        mobileNumber: json['mobileNumber'] as String?,
        role: json['role'] as String?,
        status: json['status'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
        'DOB': dob?.toIso8601String(),
        'mobileNumber': mobileNumber,
        'role': role,
        'status': status,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
