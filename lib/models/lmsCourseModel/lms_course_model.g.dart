// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lms_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LmsCourseModel _$LmsCourseModelFromJson(Map<String, dynamic> json) =>
    LmsCourseModel(
      courseId: json['courseId'] as String?,
      courseTitle: json['courseTitle'] as String?,
      courseDescription: json['courseDescription'] as String?,
      modules: (json['modules'] as List<dynamic>?)
          ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LmsCourseModelToJson(LmsCourseModel instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseTitle': instance.courseTitle,
      'courseDescription': instance.courseDescription,
      'modules': instance.modules,
    };
