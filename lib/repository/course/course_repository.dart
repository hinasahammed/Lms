import 'package:lms/data/network/network_api_services.dart';
import 'package:lms/res/appUrl/app_url.dart';

class CourseRepository {
  final _api = NetworkApiServices();

  Future<dynamic> getCourse() async {
    var result = await _api.getApi(AppUrl.course);
    return result;
  }
}
