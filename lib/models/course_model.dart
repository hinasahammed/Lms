class CourseModel {
  final String courseTitle;
  final String courseDesc;
  final List<String> whatYouWillLearnPoints;
  final List<String> requirmentDetails;
  final List<ModuleModel> modulemodel;
  final String imageurl;

  CourseModel(
     {
    required this.courseTitle,
    required this.courseDesc,
    required this.whatYouWillLearnPoints,
    required this.requirmentDetails,
    required this.imageurl,
    required this.modulemodel,
  });
}

class ModuleModel {
  final String moduleHeading;
  final List<String> moduleDesc;

  ModuleModel({
    required this.moduleHeading,
    required this.moduleDesc,
  });
}
