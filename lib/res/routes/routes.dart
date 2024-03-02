import 'package:get/get.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/view/getStarted/get_started.dart';
import 'package:lms/view/splash/splash_view.dart';

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
      ];
}
