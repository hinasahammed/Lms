import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms/models/courseModel/course_model.dart';
import 'package:lms/models/lmsCourseModel/lms_course_model.dart';
import 'package:lms/res/components/enrolledViewComponents/module_description_card.dart';
import 'package:lms/utils/course_list.dart';
import 'package:video_player/video_player.dart';

class EnrolledCourseDetails extends StatefulWidget {
  final LmsCourseModel courseModel;
  const EnrolledCourseDetails({
    super.key,
    required this.courseModel,
  });

  @override
  State<EnrolledCourseDetails> createState() => _EnrolledCourseDetailsState();
}

class _EnrolledCourseDetailsState extends State<EnrolledCourseDetails> {
  late VideoPlayerController _controller;
  double progressValue = 0.0;
  late CourseModel? course;
  String videoUrl = '';
  List<double> videoProgressList = [];
  double overallProgress = 0.0;

  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    course = getCourseByTitle(widget.courseModel.courseTitle ?? '');
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      videoUrl.isEmpty ? course!.modulemodel[0].videoUrl[0] : videoUrl,
    ))
      ..initialize().then((_) {
        setState(() {
          _controller.addListener(() {
            setState(() {
              progressValue =
                  _controller.value.position.inMilliseconds.toDouble() /
                      _controller.value.duration.inMilliseconds.toDouble();
            });
          });
        });
      });
  }

  CourseModel getCourseByTitle(String title) {
    return CourseList.courseList.firstWhere(
      (course) => course.courseTitle == title,
      orElse: () => CourseModel(
        courseTitle: 'Not Found',
        courseDesc: 'Course not found with title: $title',
        imageurl: '', // Provide default values for other properties
        whatYouWillLearnPoints: [],
        requirmentDetails: [],
        modulemodel: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video player and its content
            _controller.value.isInitialized
                ? Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Positioned(
                        bottom: 0,
                        top: 0,
                        right: 0,
                        left: 0,
                        child: InkWell(
                          onTap: _togglePlayPause,
                          child: _controller.value.isPlaying
                              ? Icon(
                                  Icons.pause,
                                  size: 50,
                                  color: Colors.white.withOpacity(.4),
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: theme.colorScheme.primary,
                            backgroundColor: Colors.white,
                            bufferedColor: Colors.grey,
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                      ),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: 200,
                    child: const CircularProgressIndicator(),
                  ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: course != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course!.courseTitle,
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: course!.modulemodel.map((courseData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  courseData.moduleHeading,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    courseData.moduleDesc.length,
                                    (descIndex) {
                                      var data =
                                          courseData.moduleDesc[descIndex];
                                      return ModuleDescriptionCard(
                                        descriptiontitle: data,
                                        onPressed: () {
                                          _controller.pause();
                                          setState(() {
                                            videoUrl =
                                                courseData.videoUrl[descIndex];
                                          });
                                          _controller = VideoPlayerController
                                              .networkUrl(Uri.parse(
                                            videoUrl.isEmpty
                                                ? course!
                                                    .modulemodel[0].videoUrl[0]
                                                : videoUrl,
                                          ))
                                            ..initialize().then((_) {
                                              setState(() {
                                                _controller.addListener(() {
                                                  setState(() {
                                                    progressValue = _controller
                                                            .value
                                                            .position
                                                            .inMilliseconds
                                                            .toDouble() /
                                                        _controller
                                                            .value
                                                            .duration
                                                            .inMilliseconds
                                                            .toDouble();
                                                  });
                                                });
                                              });
                                            });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text('Course not found!'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
