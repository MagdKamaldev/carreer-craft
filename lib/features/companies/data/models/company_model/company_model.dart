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

  CompanyModel({
    this.companyName,
    this.description,
    this.industry,
    this.address,
    this.numberOfEmployees,
    this.companyEmail,
    this.companyHr,
    this.id,
  });

  factory CompanyModel.fromJson(dynamic json) {
    return CompanyModel(
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
    );
  }

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'description': description,
        'industry': industry,
        'address': address,
        'numberOfEmployees': numberOfEmployees?.toJson(),
        'companyEmail': companyEmail,
        'companyHR': companyHr,
        '_id': id,
      };
}
