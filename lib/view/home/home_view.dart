import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/homeViewComponents/ongoing_courses.dart';
import 'package:lms/res/components/homeViewComponents/popular_course.dart';
import 'package:lms/res/components/commonWidget/shimmer_list_ui.dart';
import 'package:lms/view/allCourses/all_courses_view.dart';
import 'package:lms/view/favorite/favorite_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lms'),
        titleTextStyle: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.primary,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const FavoriteView());
            },
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(auth.currentUser!.uid)
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
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(
                'No data found!',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome!\n',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                        TextSpan(
                          text: snapshot.data!['userName']
                                  .toString()
                                  .toUpperCase()[0] +
                              snapshot.data!['userName']
                                  .toString()
                                  .substring(1),
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Find your favorite\n',
                          style: theme.textTheme.headlineMedium!.copyWith(
                            color: theme.colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Course',
                          style: theme.textTheme.headlineMedium!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Courses',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(const AllCoursesView());
                        },
                        child: Text(
                          'See all',
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 320,
                    child: PopularCourse(),
                  ),
                  const Gap(10),
                  Text(
                    'Ongoing Courses',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .25,
                    child: OngoingCourses(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
