import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/enrolledViewComponents/enrolled_course_details.dart';
import 'package:lms/res/components/enrolledViewComponents/no_enrolled_course_ui.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:shimmer/shimmer.dart';

class EnrolledCourse extends StatelessWidget {
  EnrolledCourse({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
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
          return const NoCourseDataUi(
            title: 'No Enrolled Course Yet!',
            subTitle: "You haven't enrolled any course",
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    EnrolledCourseDetails(
                      courseTitle: data['courseTitle'],
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            width: size.width * .2,
                            height: size.height * .1,
                            imageUrl: data['imageurl'],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.black.withOpacity(0.2),
                              highlightColor: Colors.white54,
                              enabled: true,
                              child: Container(
                                width: size.width * .2,
                                height: size.height * .1,
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
                ),
              );
            },
          );
        }
      },
    );
  }
}
