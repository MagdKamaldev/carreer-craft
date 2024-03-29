class ApplicationModel {
  String? jobId;
  String? userId;
  List<String>? userTechSkills;
  List<String>? userSoftSkills;
  String? userResume;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ApplicationModel({
    this.jobId,
    this.userId,
    this.userTechSkills,
    this.userSoftSkills,
    this.userResume,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      jobId: json['jobId'] as String?,
      userId: json['userId'] as String?,
      userTechSkills: json['userTechSkills'] as List<String>?,
      userSoftSkills: json['userSoftSkills'] as List<String>?,
      userResume: json['userResume'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'jobId': jobId,
        'userId': userId,
        'userTechSkills': userTechSkills,
        'userSoftSkills': userSoftSkills,
        'userResume': userResume,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
