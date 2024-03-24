import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/models/lms_course_model/lms_course_model.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/res/components/enrolledViewComponents/enrolled_course_details.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class OngoingCourses extends StatefulWidget {
  const OngoingCourses({super.key});

  @override
  State<OngoingCourses> createState() => _OngoingCoursesState();
}

class _OngoingCoursesState extends State<OngoingCourses> {
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
    final size = MediaQuery.sizeOf(context);

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
              itemCount:
                  enrolledCourses.length > 3 ? 3 : enrolledCourses.length,
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
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            width: size.width * .2,
                            height: size.height * .1,
                            imageUrl: data.imageUrl ??
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcamarasal.com%2Famet-consectetur-adipisicing-elit%2Fdefault-image-5-1%2F&psig=AOvVaw2G2rNE991rS21WNkzEXE3r&ust=1710351464783000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJDf2_Sh74QDFQAAAAAdAAAAABAE',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.black.withOpacity(0.2),
                              highlightColor: Colors.white54,
                              enabled: true,
                              child: Container(
                                width: size.width * .2,
                                height: size.height * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Text(
                            data.courseTitle ?? '',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                );
              },
            );
          }
        }
      },
    );
  }
}
