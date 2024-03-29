import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';

class JobModel {
  String? jobTitle;
  String? jobLocation;
  String? workingTime;
  String? seniorityLevel;
  String? jobDescription;
  String? id;
  List<dynamic>? technicalSkills;
  String? addedBy;
  List<String>? softSkills;
  CompanyModel? company;

  JobModel(
      {this.jobTitle,
      this.jobLocation,
      this.workingTime,
      this.seniorityLevel,
      this.jobDescription,
      this.technicalSkills,
      this.softSkills,
      this.addedBy,
      this.id,
      this.company});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'] as String?,
      addedBy: json['addedBy'] as String?,
      jobTitle: json['jobTitle'] as String?,
      jobLocation: json['jobLocation'] as String?,
      workingTime: json['workingTime'] as String?,
      seniorityLevel: json['seniorityLevel'] as String?,
      jobDescription: json['jobDescription'] as String?,
      technicalSkills: (json['technicalSkills'] as List<dynamic>?)
          ?.map((skill) => skill.toString())
          .toList(),
      softSkills: (json['softSkills'] as List<dynamic>?)
          ?.map((skill) => skill.toString())
          .toList(),
      company: json['company']?.isNotEmpty == true
          ? CompanyModel.fromJson(json['company'][0]) as CompanyModel?
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'jobTitle': jobTitle,
        'jobLocation': jobLocation,
        'workingTime': workingTime,
        'seniorityLevel': seniorityLevel,
        'jobDescription': jobDescription,
        'technicalSkills': technicalSkills,
        'softSkills': softSkills,
      };
}
