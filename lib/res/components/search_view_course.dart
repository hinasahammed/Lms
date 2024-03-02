import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SearchViewCourses extends StatelessWidget {
  const SearchViewCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) {
        return Container(
          width: 310,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                height: Get.height * .18,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://d2908q01vomqb2.cloudfront.net/da4b9237bacccdf19c0760cab7aec4a8359010b0/2023/06/26/generative-ai-with-llms-1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Generative AI with Large Language Models',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Skills you'll gain: Machine Learning, Natural Language Processing, Python Programming",
                style: theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
