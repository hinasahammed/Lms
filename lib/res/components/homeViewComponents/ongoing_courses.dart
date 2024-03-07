import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:shimmer/shimmer.dart';

class OngoingCourses extends StatelessWidget {
  OngoingCourses({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection("enrolledCourse")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const ShimmerList());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "No ongoing Courses\n You haven't enrolled any course",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView.builder(
            itemCount:
                snapshot.data!.docs.length < 3 ? snapshot.data!.docs.length : 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          width: Get.width * .2,
                          height: Get.height * .1,
                          imageUrl: data['imageurl'],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.black.withOpacity(0.2),
                            highlightColor: Colors.white54,
                            enabled: true,
                            child: Container(
                              width: Get.width * .2,
                              height: Get.height * .1,
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
                      const Gap(10),
                      Expanded(
                        child: Text(
                          data['courseTitle'],
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
