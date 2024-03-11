import 'package:json_annotation/json_annotation.dart';

part 'lecture.g.dart';

@JsonSerializable()
class Lecture {
	String? lectureId;
	String? title;
	String? videoUrl;

	Lecture({this.lectureId, this.title, this.videoUrl});

	factory Lecture.fromJson(Map<String, dynamic> json) {
		return _$LectureFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LectureToJson(this);
}
