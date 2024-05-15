import 'user_id.dart';

class GetApplicationModel {
  String? id;
  String? jobId;
  UserId? userId;
  List<dynamic>? userTechSkills;
  List<dynamic>? userSoftSkills;
  String? userResume;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetApplicationModel({
    this.id,
    this.jobId,
    this.userId,
    this.userTechSkills,
    this.userSoftSkills,
    this.userResume,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetApplicationModel.fromJson(Map<String, dynamic> json) {
    return GetApplicationModel(
      id: json['_id'] as String?,
      jobId: json['jobId'] as String?,
      userId: json['userId'] == null
          ? null
          : UserId.fromJson(json['userId'] as Map<String, dynamic>),
      userTechSkills: json['userTechSkills'] as List<dynamic>?,
      userSoftSkills: json['userSoftSkills'] as List<dynamic>?,
      userResume: json['userResume'] as String?,
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
        '_id': id,
        'jobId': jobId,
        'userId': userId?.toJson(),
        'userTechSkills': userTechSkills,
        'userSoftSkills': userSoftSkills,
        'userResume': userResume,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
