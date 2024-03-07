import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/utils/utils.dart';

class CourseDetailsViewModel extends GetxController {
  Rx<Status> favoriteStatusResponse = Status.completed.obs;
  Rx<Status> enrolledStatusResponse = Status.completed.obs;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  void setfavoriteStatusResponse(Status status) {
    favoriteStatusResponse.value = status;
  }

  void setenrolledStatusResponse(Status status) {
    enrolledStatusResponse.value = status;
  }

  void addToFavorites(
    BuildContext context,
    CourseModel courseData,
  ) async {
    setfavoriteStatusResponse(Status.loading);
    try {
      final favoritesRef = firestore
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection("favorites");

      final existingFavorite = await favoritesRef
          .where('courseTitle', isEqualTo: courseData.courseTitle)
          .get();
      if (existingFavorite.docs.isEmpty) {
        await favoritesRef.add(courseData.toMap()).then((value) {
          setfavoriteStatusResponse(Status.completed);
          Utils.showSnackbarToast(
            context,
            'Added to favorited courses',
            Icons.check_circle_rounded,
          );
        });
      } else {
        setfavoriteStatusResponse(Status.completed);
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            'This course is already in your favorites',
            Icons.check_circle_rounded,
          );
        }
      }
    } catch (e) {
      setfavoriteStatusResponse(Status.error);
      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          'Something went wrong!',
          Icons.check_circle_rounded,
        );
      }
    }
  }

  void enrollTheCourse(
    BuildContext context,
    CourseModel courseData,
  ) async {
    setenrolledStatusResponse(Status.loading);
    try {
      final enrolledref = firestore
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection("enrolledCourse");

      final existingEnrolled = await enrolledref
          .where('courseTitle', isEqualTo: courseData.courseTitle)
          .get();
      if (existingEnrolled.docs.isEmpty) {
        await enrolledref.add({
          "courseTitle": courseData.courseTitle,
          "imageurl": courseData.imageurl,
        }).then((value) {
          setenrolledStatusResponse(Status.completed);
          Utils.showSnackbarToast(
            context,
            'Successfully enrolled the course',
            Icons.check_circle_rounded,
          );
        });
      } else {
        setenrolledStatusResponse(Status.completed);
        if (context.mounted) {
          Utils.showSnackbarToast(
            context,
            'This course is already enrolled',
            Icons.check_circle_rounded,
          );
        }
      }
    } catch (e) {
      setenrolledStatusResponse(Status.error);
      if (context.mounted) {
        Utils.showSnackbarToast(
          context,
          'Something went wrong!',
          Icons.check_circle_rounded,
        );
      }
    }
  }
}
