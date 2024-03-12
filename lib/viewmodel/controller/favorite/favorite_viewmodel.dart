import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/models/courseModel/course_model.dart';
import 'package:lms/utils/utils.dart';

class FavoriteViewModel extends GetxController {
  void deleteFavorite(String courseName, BuildContext context) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("favorites")
        .where('courseTitle', isEqualTo: courseName)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete().then((_) {
          Utils.showSnackbarToast(
            context,
            'Successfully Removed',
            Icons.check_circle_rounded,
          );
        }).catchError((error) {
          Utils.showSnackbarToast(
            context,
            'Failed',
            Icons.check_circle_rounded,
          );
        });
      }
    }).catchError((error) {
      Utils.showSnackbarToast(
        context,
        'Failed',
        Icons.check_circle_rounded,
      );
    });
  }

  void toCourseDetails(Map<String, dynamic> data) {
    CourseModel courseModel = CourseModel(
      courseTitle: data['courseTitle'],
      courseDesc: data['courseDesc'],
      whatYouWillLearnPoints: List<String>.from(data['whatYouWillLearnPoints']),
      requirmentDetails: List<String>.from(data['requirmentDetails']),
      imageurl: data['imageurl'],
      modulemodel:
          List<ModuleModel>.from(data['modulemodel'].map((x) => ModuleModel(
                moduleHeading: x['moduleHeading'],
                moduleDesc: List<String>.from(x['moduleDesc']),
                videoUrl: List<String>.from(x['videoUrl']),
              ))),
    );
    // Get.to(() => CourseDetailsView(courseData: courseModel));
  }
}
