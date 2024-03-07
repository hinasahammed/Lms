import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/searchViewComponents/search_view_course.dart';
import 'package:lms/viewmodel/controller/search/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Get.put(SearchViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              controller: searchViewModel.searchController.value,
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            const Gap(10),
            const Expanded(
              child: SearchViewCourses(),
            )
          ],
        ),
      ),
    );
  }
}
