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
        "◻Basics of Programming: Python Syntax: You'll learn how to write Python code, including using keywords, statements, and expressions to create programs.You'll understand the fundamental concepts of programming, such as variables, data types, operators, and control flow statements.",
        "◻Python Syntax: You'll learn how to write Python code, including using keywords, statements, and expressions to create programs.",
        "◻Working with Data: You'll explore how to work with different data types in Python, including numbers, strings, lists, and dictionaries.",
        "◻Functions: You'll learn how to define and use functions to create reusable blocks of code.",
        "◻Conditional Statements: You'll understand how to use conditional statements like if-else statements to control the flow of your programs based on certain conditions.",
        "◻Loops: You'll learn how to use loops like for loops and while loops to automate repetitive tasks.",
        "◻Problem-solving: You'll develop problem-solving skills and apply them to write Python programs to solve various problems.",
      ],
      requirmentDetails: [
        "◻A computer with internet access",
        "◻No prior programming experience required",
      ],
      modulemodel: [
        ModuleModel(
          moduleHeading: "Module 1: Introduction to Programming",
          moduleDesc: [
            "◻What is programming?\n",
            "◻Why learn Python?\n",
            "◻Setting up your development environment",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: Python Basics",
          moduleDesc: [
            "◻Variables and data types\n",
            "◻Operators and expressions\n",
            "◻Input and output",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 3: Working with Data",
          moduleDesc: [
            "◻Numbers\n",
            "◻Strings\n",
            "◻Lists\n",
            "◻Tuples\n",
            "◻Dictionaries",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 4: Control Flow",
          moduleDesc: [
            "◻Conditional statements (if-else)\n",
            "◻Loops (for, while)",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 5: Functions",
          moduleDesc: [
            "◻Defining and using functions\n",
            "◻Arguments and parameters",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 6: Problem-solving with Python",
          moduleDesc: [
            "◻Applying Python concepts to solve real-world problems\n",
            "◻Introduction to debugging",
          ],
        )
      ],
    ),
  ];
}
