import 'number_of_employees.dart';

class CompanyModel {
  String? companyName;
  String? description;
  String? industry;
  String? address;
  NumberOfEmployees? numberOfEmployees;
  String? companyEmail;
  String? companyHr;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CompanyModel({
    this.companyName,
    this.description,
    this.industry,
    this.address,
    this.numberOfEmployees,
    this.companyEmail,
    this.companyHr,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        companyName: json['companyName'] as String?,
        description: json['description'] as String?,
        industry: json['industry'] as String?,
        address: json['address'] as String?,
        numberOfEmployees: json['numberOfEmployees'] == null
            ? null
            : NumberOfEmployees.fromJson(
                json['numberOfEmployees'] as Map<String, dynamic>),
        companyEmail: json['companyEmail'] as String?,
        companyHr: json['companyHR'] as String?,
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
        'companyName': companyName,
        'description': description,
        'industry': industry,
        'address': address,
        'numberOfEmployees': numberOfEmployees?.toJson(),
        'companyEmail': companyEmail,
        'companyHR': companyHr,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
