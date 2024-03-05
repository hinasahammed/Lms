import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/res/components/custom_button.dart';
import 'package:lms/viewmodel/courseDetails/course_details_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class CourseDetailsView extends StatelessWidget {
  final CourseModel courseData;
  const CourseDetailsView({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseDetailsViewModel = Get.put(CourseDetailsViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: CachedNetworkImage(
                  width: Get.width,
                  height: Get.height * .25,
                  imageUrl: courseData.imageurl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.black.withOpacity(0.2),
                    highlightColor: Colors.white54,
                    enabled: true,
                    child: Container(
                      height: Get.height * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseData.courseTitle,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      courseData.courseDesc,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                    Text(
                      "What you'll learn:",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...courseData.whatYouWillLearnPoints.map(
                      (e) => Text(
                        e,
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Text(
                      "Requirements:",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...courseData.requirmentDetails.map(
                      (e) => Text(
                        e,
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Text(
                      "Syllabus:",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...courseData.modulemodel.map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.moduleHeading,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ...e.moduleDesc.map(
                            (e) => Text(
                              e,
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        child: CustomButton(
                          status: courseDetailsViewModel
                              .favoriteStatusResponse.value,
                          btntitle: 'Add to favorite',
                          backColor: theme.colorScheme.primary,
                          titleColor: theme.colorScheme.onPrimary,
                          onPressed: () {
                            courseDetailsViewModel.addToFavorites(
                              context,
                              courseData,
                            );
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: CustomButton(
                        status:
                            courseDetailsViewModel.enrolledStatusResponse.value,
                        btntitle: 'Enroll now',
                        backColor: theme.colorScheme.primary,
                        titleColor: theme.colorScheme.onPrimary,
                        onPressed: () {
                          courseDetailsViewModel.enrollTheCourse(
                            context,
                            courseData,
                          );
                        },
                      ),
                    ),
                    const Gap(15)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
