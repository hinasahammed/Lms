import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/utils/utils.dart';
import 'package:lms/view/courseDetails/course_details_view.dart';

class FavoriteViewModel extends GetxController {
  void deleteFavorite(String courseName) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("favorites")
        .where('courseTitle', isEqualTo: courseName)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete().then((_) {
          Utils.showToast("Successfully Removed");
        }).catchError((error) {
          Utils.showToast("Failed");
        });
      }
    }).catchError((error) {
      Utils.showToast("Failed");
    });
  }

  void toCourseDetails( Map<String, dynamic> data){
     CourseModel courseModel = CourseModel(
                      courseTitle: data['courseTitle'],
                      courseDesc: data['courseDesc'],
                      whatYouWillLearnPoints:
                          List<String>.from(data['whatYouWillLearnPoints']),
                      requirmentDetails:
                          List<String>.from(data['requirmentDetails']),
                      imageurl: data['imageurl'],
                      modulemodel: List<ModuleModel>.from(
                          data['modulemodel'].map((x) => ModuleModel(
                                moduleHeading: x['moduleHeading'],
                                moduleDesc: List<String>.from(x['moduleDesc']),
                              ))),
                    );
                    Get.to(() => CourseDetailsView(courseData: courseModel));
  }
}
