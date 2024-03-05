import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/utils/utils.dart';

class SearchViewModel extends GetxController {
  final searchController = TextEditingController().obs;
  RxList<CourseModel> filteredList = <CourseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateFilteredList();

    searchController.value.addListener(() {
      updateFilteredList();
    });
  }

  void updateFilteredList() {
    filteredList.assignAll(Utils.courseList.where(
      (element) => element.courseTitle
          .toLowerCase()
          .contains(searchController.value.text.toLowerCase()),
    ));
  }
}
