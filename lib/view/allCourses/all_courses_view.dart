import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/view/courseDetails/course_details_view.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class AllCoursesView extends StatelessWidget {
  const AllCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All courses'),
      ),
      body: FutureBuilder(
        future: courseDetailsViewModel.getCourseData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Gap(10),
              padding: const EdgeInsets.all(16.0),
              itemCount: 3,
              itemBuilder: (context, index) => Shimmer.fromColors(
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
              ),
            );
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const NoCourseDataUi(
              title: "No course!",
              subTitle: "No Course you have",
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              height: Get.height * .2,
                              imageUrl: data.imageUrl ??
                                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcamarasal.com%2Famet-consectetur-adipisicing-elit%2Fdefault-image-5-1%2F&psig=AOvVaw2G2rNE991rS21WNkzEXE3r&ust=1710351464783000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJDf2_Sh74QDFQAAAAAdAAAAABAE',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.black.withOpacity(0.2),
                                highlightColor: Colors.white54,
                                enabled: true,
                                child: Container(
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
                          Text(
                            data.courseTitle ?? '',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
