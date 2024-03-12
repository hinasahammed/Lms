import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/view/courseDetails/course_details_view.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class PopularCourse extends StatelessWidget {
  const PopularCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    final size = MediaQuery.sizeOf(context);

    return FutureBuilder(
      future: courseDetailsViewModel.getCourseData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.black.withOpacity(0.2),
            highlightColor: Colors.white54,
            enabled: true,
            child: Container(
              width: size.width,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const NoCourseDataUi(
            title: "No course!",
            subTitle: "No popular course",
          );
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.length < 4 ? snapshot.data!.length : 4,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Get.to(
                    CourseDetailsView(
                      courseData: data,
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    width: 310,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          data.courseTitle ?? '',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          data.courseDescription ?? '',
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
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
