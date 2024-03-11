import 'package:lms/models/courseModel/course_model.dart';

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
        ),
      ],
    ),
    CourseModel(
      courseTitle: "Demystifying the Tech World",
      courseDesc:
          "This course is designed for anyone with little to no prior experience in the world of technology. It will equip you with the fundamental knowledge and skills to navigate the digital landscape confidently.",
      whatYouWillLearnPoints: [
        "◻Understand the basic components of a computer and their functions.",
        "◻Gain familiarity with essential software applications like web browsers, word processors, and email clients.",
        "◻Learn how to safely and effectively navigate the internet.",
        "◻Discover how to stay secure online and protect your privacy.",
        "◻Explore various digital tools and resources to enhance your productivity and communication.",
      ],
      requirmentDetails: [
        "◻A computer with internet access",
        "◻Basic willingness to learn and explore",
      ],
      imageurl:
          "https://media.licdn.com/dms/image/D4E10AQEILB0gxFPUbg/image-shrink_800/0/1699971975643?e=2147483647&v=beta&t=PQ_PZzv6zyKjWOdQDbW7ujEziaBO3sNZvEQ5gx96yaY",
      modulemodel: [
        ModuleModel(
          moduleHeading: "Module 1: Introduction to Computers",
          moduleDesc: [
            "◻What is a computer?",
            "◻Hardware vs. Software",
            "◻Different types of computers",
            "◻Common computer components and their functions",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1Xm5HQp9eimfYKsjJxJ0_fJjpgmV6w5R6",
            "https://drive.google.com/uc?export=download&id=1EMMcb8ZXhzWyJzZuZUn6z8qFO3UxpIyO",
            "https://drive.google.com/uc?export=download&id=1OWcCghqCkdYE5P8mWfKGtuYobaek4eYK",
            "https://drive.google.com/uc?export=download&id=167-WZAvXDZXdl-VTvAUjl4Hv2Zt442o6",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: Operating Systems",
          moduleDesc: [
            "◻Understanding operating systems",
            "◻Basic functionalities of popular operating systems (Windows, macOS)",
            "◻User interface and navigation",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1T8_Yd_Y-8k0XDd3rMNOxSpvFlZjQjTIM",
            "https://drive.google.com/uc?export=download&id=1WSujrpkrtNchKFEwDoz0RjGE8nfr_QPZ",
            "https://drive.google.com/uc?export=download&id=1alBALFGnmXQ4WRfCNHeKIaPXsk2fI8j3",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 3: Essential Software Applications",
          moduleDesc: [
            "◻Introduction to web browsers and internet browsing",
            "◻Exploring word processing software (e.g., Microsoft Word, Google Docs)",
            "◻Working with spreadsheets (e.g., Microsoft Excel, Google Sheets)",
          ],
          videoUrl: [],
        ),
        ModuleModel(
          moduleHeading: "Module 4: Internet Fundamentals",
          moduleDesc: [
            "◻Connecting to the internet",
            "◻Understanding web addresses and URLs",
            "◻Searching the web effectively",
            "◻Online safety and security measures",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=16kvqIk9BIN1Gozfys7XGvNIF8IsAcd7g",
            "https://drive.google.com/uc?export=download&id=1msFZnzeae2Go8xumjVHeIaYiSbgO8hih",
            "https://drive.google.com/uc?export=download&id=1e6WxKVoKRfFEvbfRaMDVpvu4go8rppbB",
          ],
        )
      ],
    ),
    CourseModel(
      courseTitle: "Introduction to Programming for Beginners",
      courseDesc:
          "Have you ever wondered how the websites and apps you use are created? This course introduces you to the fascinating world of programming, where you'll learn how to code and bring your creative ideas to life!",
      whatYouWillLearnPoints: [
        "◻Understand the basic principles of programming logic and problem-solving.",
        "◻Get familiar with fundamental programming concepts like variables, data types, and control flow.",
        "◻Learn a beginner-friendly programming language like Python (or Scratch for a more visual approach).",
        "◻Write basic programs to perform simple tasks and create interactive experiences.",
        "◻Spark your creativity and explore the potential of coding in various fields.",
      ],
      requirmentDetails: [
        "◻A computer with internet access",
        "◻A curious mind and a desire to learn",
        "◻No prior programming experience needed",
      ],
      imageurl:
          "https://dotnettrickscloud.blob.core.windows.net/article/3720230518234845.webp",
      modulemodel: [
        ModuleModel(
          moduleHeading: "Module 1: Programming Fundamentals",
          moduleDesc: [
            "◻What is programming and what can you do with it?",
            "◻Introduction to different programming languages",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1IXi_Y9q4YlRGAu4-xoJdoqE_PwTAKl7A",
            "https://drive.google.com/uc?export=download&id=1IXi_Y9q4YlRGAu4-xoJdoqE_PwTAKl7A",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 2: Your First Steps in Coding",
          moduleDesc: [
            "◻Setting up your coding environment",
            "◻Learning the syntax and structure of your chosen language",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=1IXi_Y9q4YlRGAu4-xoJdoqE_PwTAKl7A",
            "https://drive.google.com/uc?export=download&id=1R69IvYWv_ajbqvlMc9HQZb1bJsmJvVb2",
          ],
        ),
        ModuleModel(
          moduleHeading: "Module 3: Building Blocks of Code",
          moduleDesc: [
            "◻Working with variables and data types (numbers, text, booleans)",
            "◻Using operators to perform calculations and comparisons",
          ],
          videoUrl: [
            "https://drive.google.com/uc?export=download&id=10rkgbdBpV2qXr2XugPEeuCFri4KRhXWh",
            "https://drive.google.com/uc?export=download&id=1vgZ226y0RuYWiMowlNbh9e3x2gZ6iFRf",
          ],
        ),
      ],
    )
  ];
}
