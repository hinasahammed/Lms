import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/enrolled_course_details.dart';
import 'package:lms/res/components/no_enrolled_course_ui.dart';
import 'package:lms/res/components/shimmer_list_ui.dart';
import 'package:shimmer/shimmer.dart';

class EnrolledCourse extends StatelessWidget {
  EnrolledCourse({super.key});
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
          return const NoEnrolledCourseUi();
        } else {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            children: snapshot.data!.docs.map((enrolledCourse) {
              return InkWell(
                onTap: () {
                  Get.to(() => EnrolledCourseDetails(
                        courseTitle: enrolledCourse['courseTitle'],
                      ));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            width: Get.width * .2,
                            height: Get.height * .1,
                            imageUrl: enrolledCourse['imageurl'],
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
                          child: Column(
                            children: [
                              Text(
                                enrolledCourse['courseTitle'],
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      color: theme.colorScheme.primary,
                                      value: .5,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    '60%',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
