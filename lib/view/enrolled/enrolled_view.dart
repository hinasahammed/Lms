import 'package:flutter/material.dart';
import 'package:lms/res/components/enrolled_course.dart';

class EnrolledView extends StatelessWidget {
  const EnrolledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrolled Course'),
      ),
      body: EnrolledCourse(),
    );
  }
}
