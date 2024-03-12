import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/models/lmsCourseModel/lms_course_model.dart';
import 'package:lms/viewmodel/controller/courseDetails/course_details_viewmodel.dart';

class SearchViewModel extends GetxController {
  final searchController = TextEditingController().obs;
  RxList<LmsCourseModel> filteredList = <LmsCourseModel>[].obs;
  final courseDetailsViewModel = Get.put(CourseDetailsViewModel());

  @override
  void onInit() {
    super.onInit();
    updateFilteredList();

    searchController.value.addListener(() {
      updateFilteredList();
    });
  }

  void updateFilteredList() {
    filteredList.assignAll(courseDetailsViewModel.courseList.where(
      (element) => element.courseTitle!
          .toLowerCase()
          .contains(searchController.value.text.toLowerCase()),
    ));
  }
}
