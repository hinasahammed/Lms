import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/models/lmsCourseModel/lms_course_model.dart';
import 'package:lms/res/components/enrolledViewComponents/enrolled_course_details.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnrolledCourse extends StatefulWidget {
  const EnrolledCourse({super.key});

  @override
  State<EnrolledCourse> createState() => _EnrolledCourseState();
}

class _EnrolledCourseState extends State<EnrolledCourse> {
  late final SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();
    loadEnrolledCourses();
  }

  Future<void> loadEnrolledCourses() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    return FutureBuilder(
      future: courseDetailsViewModel.getCourseData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            itemBuilder: (context, index) => const ShimmerList(),
          );
        } else if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const NoCourseDataUi(
            title: "No enrolled course!",
            subTitle: "You haven't enrolled any course",
          );
        } else {
          final List<String> allEnrolledCourses =
              _preferences.getStringList("enrolledCourse") ?? [];
          final List<LmsCourseModel> enrolledCourses = snapshot.data!
              .where(
                  (course) => allEnrolledCourses.contains(course.courseTitle))
              .toList();
          if (enrolledCourses.isEmpty || enrolledCourses == []) {
            return const NoCourseDataUi(
              title: "No enrolled course!",
              subTitle: "You haven't enrolled any course",
            );
          } else {
            return ListView.builder(
              itemCount: enrolledCourses.length,
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = enrolledCourses[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      EnrolledCourseDetails(
                        courseModel: data,
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        data.courseTitle ?? '',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      trailing: const Icon(Icons.swipe_right_alt),
                    ),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }
}
