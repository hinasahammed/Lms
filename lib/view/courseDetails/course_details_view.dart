import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/models/lmsCourseModel/lms_course_model.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';

class CourseDetailsView extends StatelessWidget {
  final LmsCourseModel courseData;
  const CourseDetailsView({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseData.courseTitle ?? '',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              courseData.courseDescription ?? '',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            const Gap(10),
            Text(
              "Syllabus:",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...courseData.modules!.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.moduleHeading ?? '',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...e.lectures!.map(
                    (e) => Text(
                      "◻${e.title ?? ''}",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              );
            }),
            const Spacer(),
            SizedBox(
              width: size.width,
              height: 50,
              child: CustomButton(
                // status:
                //     courseDetailsViewModel.enrolledStatusResponse.value,
                btntitle: 'Enroll now',
                backColor: theme.colorScheme.primary,
                titleColor: theme.colorScheme.onPrimary,
                onPressed: () {
                  courseDetailsViewModel.enrollNowSheet(
                    context,
                    courseData.courseTitle ?? '',
                  );
                },
              ),
            ),
            const Gap(15)
          ],
        ),
      ),
    );
  }
}
