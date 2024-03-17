class JobModel {
  String? jobTitle;
  String? jobLocation;
  String? workingTime;
  String? seniorityLevel;
  String? jobDescription;
  String? id;
  List<dynamic>? technicalSkills;
  List<String>? softSkills;

  JobModel({
    this.jobTitle,
    this.jobLocation,
    this.workingTime,
    this.seniorityLevel,
    this.jobDescription,
    this.technicalSkills,
    this.softSkills,
    this.id,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'] as String?,
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
