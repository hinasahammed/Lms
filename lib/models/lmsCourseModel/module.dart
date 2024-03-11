import 'package:json_annotation/json_annotation.dart';

import 'lecture.dart';

part 'module.g.dart';

@JsonSerializable()
class Module {
	String? moduleId;
	String? moduleHeading;
	String? moduleDescription;
	List<Lecture>? lectures;

	Module({
		this.moduleId, 
		this.moduleHeading, 
		this.moduleDescription, 
		this.lectures, 
	});

	factory Module.fromJson(Map<String, dynamic> json) {
		return _$ModuleFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
