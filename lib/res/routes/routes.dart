import 'package:get/get.dart';
import 'package:lms/res/routes/routes_name.dart';
import 'package:lms/view/splash/splash_view.dart';

class Routes {
  static appRoute() => [
        GetPage(
          name: RoutesName.splashView,
          page: () => const SplashView(),
        ),
      ];
}
