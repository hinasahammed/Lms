import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/view/courseDetails/course_details_view.dart';
import 'package:lms/viewmodel/controller/search/search_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class SearchViewCourses extends StatelessWidget {
  const SearchViewCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchViewModel = Get.put(SearchViewModel());

    return Obx(() {
      if (searchViewModel.filteredList.isEmpty ||
          searchViewModel.filteredList == []) {
        return Center(
          child: Text(
            'No course found!',
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
        );
      } else {
        return ListView.separated(
            shrinkWrap: true,
            itemCount: searchViewModel.filteredList.length,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              var data = searchViewModel.filteredList[index];

              return InkWell(
                onTap: () {
                  Get.to(CourseDetailsView(courseData: data));
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
            });
      }
    });
  }
}
