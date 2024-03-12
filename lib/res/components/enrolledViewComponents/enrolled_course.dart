import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/enrolledViewComponents/enrolled_course_details.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';

class EnrolledCourse extends StatelessWidget {
  const EnrolledCourse({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    return FutureBuilder(
      future: courseDetailsViewModel.getCourseData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
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
      },
    );
  }
}
