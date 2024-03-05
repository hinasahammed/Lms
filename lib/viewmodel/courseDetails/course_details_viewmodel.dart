import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/data/response/status.dart';
import 'package:lms/utils/utils.dart';

class CourseDetailsViewModel extends GetxController {
  Rx<Status> reqStatusResponse = Status.completed.obs;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void addToFavorites(
    BuildContext context,
    String courseName,
    String imageUrl,
  ) async {
    try {
      await firestore
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection("favorites")
          .doc()
          .set(
        {
          "courseName": courseName,
          "imageUrl": imageUrl,
        },
      ).then((value) {
        Utils.showToast('Added to favorites');
      });
    } catch (e) {
      print(e);
    }
  }
}
