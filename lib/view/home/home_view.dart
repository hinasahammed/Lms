import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/res/components/ongoing_courses.dart';
import 'package:lms/res/components/popular_course.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lms'),
        titleTextStyle: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.primary,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
                    text: 'james',
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
                  onPressed: () {},
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
            const OngoingCourses(),
          ],
        ),
      ),
    );
  }
}
