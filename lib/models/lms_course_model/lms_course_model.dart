import 'package:json_annotation/json_annotation.dart';

import 'module.dart';

part 'lms_course_model.g.dart';

@JsonSerializable()
class LmsCourseModel {
	String? courseId;
	@JsonKey(name: 'image_url') 
	String? imageUrl;
	String? courseTitle;
	String? courseDescription;
	List<Module>? modules;

	LmsCourseModel({
		this.courseId, 
		this.imageUrl, 
		this.courseTitle, 
		this.courseDescription, 
		this.modules, 
	});

	factory LmsCourseModel.fromJson(Map<String, dynamic> json) {
		return _$LmsCourseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LmsCourseModelToJson(this);
}
