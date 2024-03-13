class JobModel {
  String? jobTitle;
  String? jobLocation;
  String? workingTime;
  String? seniorityLevel;
  String? jobDescription;
  List<dynamic>? technicalSkills;
  List<dynamic>? softSkills;

  JobModel({
    this.jobTitle,
    this.jobLocation,
    this.workingTime,
    this.seniorityLevel,
    this.jobDescription,
    this.technicalSkills,
    this.softSkills,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        jobTitle: json['jobTitle'] as String?,
        jobLocation: json['jobLocation'] as String?,
        workingTime: json['workingTime'] as String?,
        seniorityLevel: json['seniorityLevel'] as String?,
        jobDescription: json['jobDescription'] as String?,
        technicalSkills: json['technicalSkills'] as List<dynamic>?,
        softSkills: json['softSkills'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'jobTitle': jobTitle,
        'jobLocation': jobLocation,
        'workingTime': workingTime,
        'seniortyLevel': seniorityLevel,
        'jobDescription': jobDescription,
        'technicalSkills': technicalSkills,
        'softSkills': softSkills,
      };
}
