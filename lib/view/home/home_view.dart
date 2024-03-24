import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms/res/components/homeViewComponents/ongoing_courses.dart';
import 'package:lms/res/components/homeViewComponents/popular_course.dart';
import 'package:lms/res/routes/routes_name.dart';

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
              Get.toNamed(RoutesName.favorites);
            },
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
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
                    Get.toNamed(RoutesName.allCourses);
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
              height: 280,
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
              child: const OngoingCourses(),
            ),
          ],
        ),
      ),
    );
  }
}
