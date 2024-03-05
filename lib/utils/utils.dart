import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lms/models/course_model.dart';

class Utils {
  static List<CourseModel> courseList = [
    CourseModel(
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk6PGllc5wfzbBMk1GIlH_qHSeoqWdAFCypw&usqp=CAU',
      courseTitle: 'Python Programming for Beginners',
      courseDesc:
          'This course is designed for beginners with no prior programming experience who want to learn the fundamentals of Python, a versatile and popular programming language used in various fields like web development, data science, and machine learning.',
      whatYouWillLearnPoints: [
        "◻Basics of Programming: Python Syntax: You'll learn how to write Python code, including using keywords, statements, and expressions to create programs.You'll understand the fundamental concepts of programming, such as variables, data types, operators, and control flow statements.",
        "◻Python Syntax: You'll learn how to write Python code, including using keywords, statements, and expressions to create programs.",
        "◻Working with Data: You'll explore how to work with different data types in Python, including numbers, strings, lists, and dictionaries.",
        "◻Functions: You'll learn how to define and use functions to create reusable blocks of code.",
        "◻Conditional Statements: You'll understand how to use conditional statements like if-else statements to control the flow of your programs based on certain conditions.",
        "◻Loops: You'll learn how to use loops like for loops and while loops to automate repetitive tasks.",
        "◻Problem-solving: You'll develop problem-solving skills and apply them to write Python programs to solve various problems.",
      ],
      requirmentDetails: [
        "◻A computer with internet access",
        "◻No prior programming experience required",
      ],
      modulemodel: [
        ModuleModel(
          moduleHeading: "Module 1: Introduction to Programming",
          moduleDesc: [
            "◻What is programming?",
            "◻Why learn Python?",
            "◻Setting up your development environment",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: Python Basics",
          moduleDesc: [
            "◻Variables and data types",
            "◻Operators and expressions",
            "◻Input and output",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 3: Working with Data",
          moduleDesc: [
            "◻Numbers",
            "◻Strings",
            "◻Lists",
            "◻Tuples",
            "◻Dictionaries",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 4: Control Flow",
          moduleDesc: [
            "◻Conditional statements (if-else)",
            "◻Loops (for, while)",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 5: Functions",
          moduleDesc: [
            "◻Defining and using functions",
            "◻Arguments and parameters",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 6: Problem-solving with Python",
          moduleDesc: [
            "◻Applying Python concepts to solve real-world problems",
            "◻Introduction to debugging",
          ],
        )
      ],
    ),
    CourseModel(
      courseTitle: "Crash Course on Web Development",
      courseDesc:
          "This course is designed for anyone with little to no coding experience who is interested in learning the fundamentals of web development. You'll learn the basic building blocks of the web, including HTML, CSS, and JavaScript, and gain the skills to create your own simple web pages.",
      whatYouWillLearnPoints: [
        "◻Understand the core technologies behind the web (HTML, CSS, JavaScript)",
        "◻Write HTML code to structure the content and layout of a web page",
        "◻Use CSS to style your web pages with fonts, colors, and layouts",
        "◻Add interactivity to your web pages with basic JavaScript",
      ],
      requirmentDetails: [
        "◻A computer with an internet connection",
        "◻A text editor (such as Notepad or Sublime Text)",
        "◻A willingness to learn!",
      ],
      imageurl: "https://img-c.udemycdn.com/course/750x422/365886_45be_3.jpg",
      modulemodel: [
        ModuleModel(
          moduleHeading: "Module 1: Introduction to Web Development",
          moduleDesc: [
            "What is web development?",
            "The history of the web",
            "The different types of web development",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: HTML Basics",
          moduleDesc: [
            "◻Introduction to HTML",
            "◻HTML tags and attributes",
            "◻Building a basic web page structure",
            "◻Adding text, images, and links",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 3: Styling with CSS",
          moduleDesc: [
            "◻Introduction to CSS",
            "◻CSS selectors",
            "◻Styling text, fonts, and colors",
            "◻Layouts with CSS",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 4: Introduction to JavaScript",
          moduleDesc: [
            "◻Introduction to JavaScript",
            "◻Basic JavaScript syntax",
            "◻Working with variables and data types",
            "◻Adding interactivity with events",
          ],
        ),
      ],
    )
  ];

  static void showAwesomeSnackbar(
    String title,
    String message,
    BuildContext context,
    ContentType contentType,
    double height,
  ) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: height,
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showDialog(
    BuildContext context,
    void Function()? btnOkOnPress,
    DialogType dialogType,
    String title,
    String desc,
  ) {
    final theme = Theme.of(context);
    AwesomeDialog(
      context: context,
      descTextStyle: theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      ),
      titleTextStyle: theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onBackground,
      ),
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {
        Get.back();
      },
      btnOkOnPress: btnOkOnPress,
    ).show();
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
