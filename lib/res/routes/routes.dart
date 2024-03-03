import 'package:get/get.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/view/allCourses/all_courses_view.dart';
import 'package:lms/view/editProfile/edit_profile_view.dart';
import 'package:lms/view/getStarted/get_started.dart';
import 'package:lms/view/home/home_view.dart';
import 'package:lms/view/login/login_view.dart';
import 'package:lms/view/register/register_view.dart';
import 'package:lms/view/reset/reset_password_view.dart';
import 'package:lms/view/search/search_view.dart';
import 'package:lms/view/splash/splash_view.dart';
import 'package:lms/view/tabBar/tab_bar_view.dart';

class Routes {
  static appRoute() => [
        GetPage(
          name: RoutesName.splashView,
          page: () => const SplashView(),
        ),
        GetPage(
          name: RoutesName.getStarted,
          page: () => const Getstarted(),
        ),
        GetPage(
          name: RoutesName.login,
          page: () => const LoginView(),
        ),
        GetPage(
          name: RoutesName.register,
          page: () => const RegisterView(),
        ),
        GetPage(
          name: RoutesName.resetPassword,
          page: () => const ResetPassWordView(),
        ),
        GetPage(
          name: RoutesName.tabBar,
          page: () => const TabBarView(),
        ),
        GetPage(
          name: RoutesName.home,
          page: () => const HomeView(),
        ),
        GetPage(
          name: RoutesName.search,
          page: () => const SearchView(),
        ),
        GetPage(
          name: RoutesName.editProfile,
          page: () => const EditProfileView(),
        ),
        GetPage(
          name: RoutesName.allCourses,
          page: () => const AllCoursesView(),
        ),
      ];
}
