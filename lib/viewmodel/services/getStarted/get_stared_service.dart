import 'package:shared_preferences/shared_preferences.dart';

class GetStartedService {
  static void setGetStarted(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('Get_started', value);

  }
}
