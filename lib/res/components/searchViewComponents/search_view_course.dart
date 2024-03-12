import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/viewmodel/controller/search/search_viewmodel.dart';

class SearchViewCourses extends StatelessWidget {
  const SearchViewCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchViewModel = Get.put(SearchViewModel());

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: searchViewModel.filteredList.length,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          var data = searchViewModel.filteredList[index];
          return InkWell(
            onTap: () {
              // Get.to(CourseDetailsView(courseData: data));
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
      ),
    );
  }
}
