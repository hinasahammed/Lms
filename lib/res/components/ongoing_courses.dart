import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OngoingCourses extends StatelessWidget {
  const OngoingCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Container(
                  width: Get.width * .2,
                  height: Get.height * .1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://d2908q01vomqb2.cloudfront.net/da4b9237bacccdf19c0760cab7aec4a8359010b0/2023/06/26/generative-ai-with-llms-1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Generative AI with Large Language Models',
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
        );
      },
    );
  }
}
