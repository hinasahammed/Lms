class CourseModel {
  final String courseTitle;
  final String courseDesc;
  final List<String> whatYouWillLearnPoints;
  final List<String> requirmentDetails;
  final List<ModuleModel> modulemodel;
  final String imageurl;

  CourseModel({
    required this.courseTitle,
    required this.courseDesc,
    required this.whatYouWillLearnPoints,
    required this.requirmentDetails,
    required this.imageurl,
    required this.modulemodel,
  });

  // Convert CourseModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'courseTitle': courseTitle,
      'courseDesc': courseDesc,
      'whatYouWillLearnPoints': whatYouWillLearnPoints,
      'requirmentDetails': requirmentDetails,
      'imageurl': imageurl,
      'modulemodel': modulemodel.map((module) => module.toMap()).toList(),
    };
  }
}

class ModuleModel {
  final String moduleHeading;
  final List<String> moduleDesc;

  ModuleModel({
    required this.moduleHeading,
    required this.moduleDesc,
  });

  // Convert ModuleModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'moduleHeading': moduleHeading,
      'moduleDesc': moduleDesc,
    };
  }
}
