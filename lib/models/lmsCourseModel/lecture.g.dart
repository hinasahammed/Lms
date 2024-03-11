// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lecture _$LectureFromJson(Map<String, dynamic> json) => Lecture(
      lectureId: json['lectureId'] as String?,
      title: json['title'] as String?,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$LectureToJson(Lecture instance) => <String, dynamic>{
      'lectureId': instance.lectureId,
      'title': instance.title,
      'videoUrl': instance.videoUrl,
    };
