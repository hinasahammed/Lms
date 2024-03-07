import 'package:lms/models/course_model.dart';

class CourseList {
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1fG2QcRbgJvD5-cn0cPXDnIfS9MMk54GC",
            "https://drive.google.com/uc?export=download&id=1EenrP8qqggUsmcNJWNUFWz9bD-AQeayZ",
            "https://drive.google.com/uc?export=download&id=1uQb2MxE3155PGpMl1BQEDT_bWga3wqxR",
          ],
          isCompleted: [
            false,
            false,
            false,
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: Python Basics",
          moduleDesc: [
            "◻Variables and data types",
            "◻Operators and expressions",
            "◻Input and output",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1hAjpgzDo7DaAuCOl0wncM8ZMpm5Rc69r",
            "https://drive.google.com/uc?export=download&id=1opIzGcGKBb94Rx2zep9GCTdbES-FQJK5",
            "https://drive.google.com/uc?export=download&id=1C4Lx7DD7iBdfedJ63I_8WZiZdPOd1SAB",
          ],
          isCompleted: [
            false,
            false,
            false,
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1UM8crH9HzYbH_iA5ji2wq4G5HXRg-JGg",
            "https://drive.google.com/uc?export=download&id=11THOga3jbqMbT9DQSLROeDX63u5y8mTZ",
            "https://drive.google.com/uc?export=download&id=1P4RCfC-pQStA6w5eB8lvZRBnWTYGr8yB",
            "https://drive.google.com/uc?export=download&id=1Vgeg3E9FEL0tttW_FJgHnbnHVRn_sFQR",
            "https://drive.google.com/uc?export=download&id=1YUPIdL49SCuE88npIp8tHHKT1KxUH5aq",
          ],
          isCompleted: [
            false,
            false,
            false,
            false,
            false,
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 4: Control Flow",
          moduleDesc: [
            "◻Conditional statements (if-else)",
            "◻Loops (for, while)",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1TML5iFMllCq6d38_Wg3D031uFx-c6sQL",
            "https://drive.google.com/uc?export=download&id=1bgS6qpdAdsDlF-VwyOETqQXB0uV7m3dM",
          ],
          isCompleted: [
            false,
            false,
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 5: Functions",
          moduleDesc: [
            "◻Defining and using functions",
            "◻Arguments and parameters",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1KB1H5qR6Rro3nJTcDx6jtHyeUDfY97XA",
            "https://drive.google.com/uc?export=download&id=1m_fjScYug1OWyVRsl506XwDxf08fZvok",
          ],
          isCompleted: [
            false,
            false,
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 6: Problem-solving with Python",
          moduleDesc: [
            "◻Applying Python concepts to solve real-world problems",
            "◻Introduction to debugging",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1mUUQ86n7ojhoOHdTkEzAeObCt7ail11p",
            "https://drive.google.com/uc?export=download&id=1mUUQ86n7ojhoOHdTkEzAeObCt7ail11p",
          ],
          isCompleted: [
            false,
            false,
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=15e-__LzCthUSlpX92wlmjc4fouXye0vw",
            "https://drive.google.com/uc?export=download&id=1Sf1xWdsk3ZWMfF4xXotO7ntTLQTsgv9p",
            "https://drive.google.com/uc?export=download&id=1RBgtAlLCH1GEgddTfQFYANU7b_mp_mNA",
          ],
          isCompleted: [
            false,
            false,
            false,
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1lrSBPsj_nQsx91L6rSvYxUFfvpfqp6oK",
            "https://drive.google.com/uc?export=download&id=1O6lJc494I-KsM1IGWBgvghB3_Mez_83-",
            "https://drive.google.com/uc?export=download&id=1TtjtX_L9zDse6amz4IHXLc8EdVlOH7s8",
            "https://drive.google.com/uc?export=download&id=1EtmSfAvPUXXa815tRRGrbEsIUTsYTKyY",
          ],
          isCompleted: [
            false,
            false,
            false,
            false,
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=16w7u_S9B4rgNTldUMs31YP9NhEBylauj",
            "https://drive.google.com/uc?export=download&id=1A8eMKj5jdZNajKkVC5Yuj6YeVC4X4uuK",
            "https://drive.google.com/uc?export=download&id=1B9pVypJYmfmq5bdgKV6BeTInpVqs7d9I",
            "https://drive.google.com/file/d/14uhq02crm1Rm6dhXg0k2GYB3L96QthKY/view?usp=sharing",
          ],
          isCompleted: [
            false,
            false,
            false,
            false,
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
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1vQQHDbjgG730sXUeg5oHIggWBeIX3-BR",
            "https://drive.google.com/file/d/1paQ3rHJK-Ykq4ZJUoLSAnQjWeqrDN22z/view?usp=sharing",
            "https://drive.google.com/uc?export=download&id=1gMO-rwdh5hbUUmGFaMRg9Gtv0jO0A6cD",
            "https://drive.google.com/uc?export=download&id=1FICgpf0zAdlL2KD6CzqjFvaZcLtGWfo-",
          ],
          isCompleted: [
            false,
            false,
            false,
            false,
          ],
        ),
      ],
    )
  ];
}
