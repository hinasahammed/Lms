import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/models/lms_course_model/lms_course_model.dart';
import 'package:lms/res/components/commonWidget/custom_button.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class CourseDetailsView extends StatefulWidget {
  final LmsCourseModel courseData;
  const CourseDetailsView({super.key, required this.courseData});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  @override
  void initState() {
    super.initState();
    courseDetailsViewModel.getIsFavorite(widget.courseData.courseTitle ?? '');
  }

  final courseDetailsViewModel = Get.put(CourseDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          width: size.width,
                          height: size.height * .25,
                          imageUrl: widget.courseData.imageUrl ??
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
                      Text(
                        widget.courseData.courseTitle ?? '',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.courseData.courseDescription ?? '',
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
                      ...widget.courseData.modules!.map((e) {
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
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: CustomButton(
                        btntitle: 'Enroll now',
                        backColor: theme.colorScheme.primary,
                        titleColor: theme.colorScheme.onPrimary,
                        onPressed: () {
                          courseDetailsViewModel.enrollNowSheet(
                            context,
                            widget.courseData.courseTitle ?? '',
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            theme.colorScheme.onBackground.withOpacity(.1),
                        foregroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        courseDetailsViewModel.isFavorite.value
                            ? courseDetailsViewModel.removeFavoriteItem(
                                context, widget.courseData.courseTitle ?? '')
                            : courseDetailsViewModel.addToFavorite(
                                courseName: widget.courseData.courseTitle ?? '',
                                context: context,
                              );
                      },
                      child: Icon(
                        courseDetailsViewModel.isFavorite.value
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
