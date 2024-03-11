// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module(
      moduleId: json['moduleId'] as String?,
      moduleHeading: json['moduleHeading'] as String?,
      moduleDescription: json['moduleDescription'] as String?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'moduleId': instance.moduleId,
      'moduleHeading': instance.moduleHeading,
      'moduleDescription': instance.moduleDescription,
      'lectures': instance.lectures,
    };
