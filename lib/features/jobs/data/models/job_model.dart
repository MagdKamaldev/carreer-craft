class JobModel {
  String? jobTitle;
  String? jobLocation;
  String? workingTime;
  String? seniortyLevel;
  String? jobDescription;
  List<String>? technicalSkills;
  List<String>? softSkills;
  String? addedBy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  JobModel({
    this.jobTitle,
    this.jobLocation,
    this.workingTime,
    this.seniortyLevel,
    this.jobDescription,
    this.technicalSkills,
    this.softSkills,
    this.addedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        jobTitle: json['jobTitle'] as String?,
        jobLocation: json['jobLocation'] as String?,
        workingTime: json['workingTime'] as String?,
        seniortyLevel: json['seniortyLevel'] as String?,
        jobDescription: json['jobDescription'] as String?,
        technicalSkills: json['technicalSkills'] as List<String>?,
        softSkills: json['softSkills'] as List<String>?,
        addedBy: json['addedBy'] as String?,
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
        'jobTitle': jobTitle,
        'jobLocation': jobLocation,
        'workingTime': workingTime,
        'seniortyLevel': seniortyLevel,
        'jobDescription': jobDescription,
        'technicalSkills': technicalSkills,
        'softSkills': softSkills,
        'addedBy': addedBy,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
