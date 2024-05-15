class UserId {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? dob;
  String? mobileNumber;

  UserId({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.mobileNumber,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        dob: json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
        mobileNumber: json['mobileNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'DOB': dob?.toIso8601String(),
        'mobileNumber': mobileNumber,
      };
}
