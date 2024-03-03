import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/courseDetails/course_details_view.dart';
import 'package:shimmer/shimmer.dart';

class PopularCourse extends StatelessWidget {
  const PopularCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: Utils.courseList.length,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) {
        var data = Utils.courseList[index];
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
                      height: Get.height * .18,
                      imageUrl: data.imageurl,
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    data.courseTitle,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Skills you'll gain: Machine Learning, Natural Language Processing, Python Programming",
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
}
